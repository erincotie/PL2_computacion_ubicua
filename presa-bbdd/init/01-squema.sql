-- Lecturas periódicas de los sensores
CREATE TABLE lecturas (
  id           BIGSERIAL PRIMARY KEY,
  ts           TIMESTAMPTZ NOT NULL DEFAULT now(),
  nivel_agua   REAL,       -- unidad: valor ADC del sensor o %, decidid y documentadlo
  luminosidad  REAL,       -- valor ADC LDR
  vibracion    BOOLEAN     -- SW-420: detectada / no detectada
);
CREATE INDEX idx_lecturas_ts ON lecturas (ts DESC);

-- Estado de actuadores y órdenes (automáticas y manuales)
CREATE TABLE ordenes (
  id        BIGSERIAL PRIMARY KEY,
  ts        TIMESTAMPTZ NOT NULL DEFAULT now(),
  actuador  TEXT NOT NULL CHECK (actuador IN ('compuerta','leds','zumbador')),
  accion    TEXT NOT NULL,   -- 'abrir','cerrar','on','off'
  origen    TEXT NOT NULL CHECK (origen IN ('auto','usuario')),
  confirmada BOOLEAN DEFAULT FALSE  -- true cuando el ESP32 confirma la ejecución
);
CREATE INDEX idx_ordenes_ts ON ordenes (ts DESC);

-- Eventos relevantes (alarmas, cambios de contexto)
CREATE TABLE eventos (
  id      BIGSERIAL PRIMARY KEY,
  ts      TIMESTAMPTZ NOT NULL DEFAULT now(),
  tipo    TEXT NOT NULL,     -- 'nivel_alto','sismo','noche','fallo_sensor'
  detalle TEXT
);

