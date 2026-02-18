# Database Schema (MVP - Local SQLite)

## Table: tasks

id (UUID)
title (TEXT)
description (TEXT nullable)
type (task/event)
date (DATE)
time (TIME nullable)
reminder_time (DATETIME nullable)
created_at (DATETIME)
is_completed (BOOLEAN)
