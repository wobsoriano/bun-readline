import { describe, it, expect } from 'bun:test'
import { readline } from '../src'

describe('should', () => {
  it('export readline', () => {
    const exported = !!readline
    expect(exported).toBe(true)
  })
})
