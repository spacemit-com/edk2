/** @file

  Linker script for GCC based RISC-V ACPI table builds.

  This script is used instead of the default linker script to avoid
  the "PHDR segment not covered by LOAD segment" error with binutils 2.39+,
  which occurs when the ELF program header table is not within any LOAD
  segment's address range.

  Copyright (c) 2010 - 2021, Intel Corporation. All rights reserved.<BR>
  Copyright (c) 2015, Linaro Ltd. All rights reserved.<BR>
  Copyright (c) 2026, SpacemiT Co., Ltd. All rights reserved.<BR>

  SPDX-License-Identifier: BSD-2-Clause-Patent

**/

PHDRS {
  data PT_LOAD FILEHDR PHDRS FLAGS(6);	/* RW_ */
}

SECTIONS {
  . = SIZEOF_HEADERS;

  .data : ALIGN(8) {
    *(.data .data.*)
    *(.rodata .rodata.*)
    *(.srodata .srodata.*)
    *(.sdata .sdata.*)
    *(.bss .bss.*)
    *(.sbss .sbss.*)
  } :data

  /DISCARD/ : {
    *(.text)
    *(.text.*)
    *(.note.GNU-stack)
    *(.gnu_debuglink)
    *(.interp)
    *(.dynsym)
    *(.dynstr)
    *(.hash .gnu.hash)
    *(.comment)
    *(.dynamic)
    *(.rela.*)
    *(.rel.*)
    *(.got)
    *(.got.*)
    *(.riscv.attributes)
  }
}
