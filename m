Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A180BFB186
	for <lists+samba-technical@lfdr.de>; Wed, 22 Oct 2025 11:12:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=vfWn+YagEfj84h2L3GgLyxE8DyJJrOx+p8HiquHSnW0=; b=QAZXFrccpIDlOK68Q7ry3lI7Cx
	KAiU5gxw7exh4H34rEwV8SbZCxpkxTBw9aXF5VW2zp4iWP3W9iQ0Bhh4RhCRpjh7KG6ZlCTV4OejU
	vOYAIKNuuwSO9lssEFlG1CI9d2ipji6jTgmz4YNL0er2J0NwNthlvY+7tTQRgnDlK7iE60+itLOjG
	3fOeAtu2WZeMf7GxNeGyr4YIx3YXDsHUfUXCPxdNb3/A/0Dl/kHQOpNnzL+EDfaJX2npknHEjCoBh
	GcpCWNVsalHjuMCRFoE3TcyznbKAIJj8GH2xVXWynYd7z3f3HEU+DKF4KCCIkpEjeVeZDUdgRGMXP
	TtiXzSoQ==;
Received: from ip6-localhost ([::1]:49470 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vBUtX-008UTu-7s; Wed, 22 Oct 2025 09:12:35 +0000
Received: from cat-hlzsim-prod-mail20.catalyst.net.nz
 ([103.250.241.203]:38916) by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vBUtQ-008UTn-9Y
 for samba-technical@lists.samba.org; Wed, 22 Oct 2025 09:12:32 +0000
Received: from [192.168.1.219] (unknown [114.23.142.188])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-hlzsim-prod-mail20.catalyst.net.nz (Postfix) with ESMTPSA id AEFCF17D; 
 Wed, 22 Oct 2025 21:55:23 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=catalyst.net.nz;
 s=default; t=1761123323;
 bh=LQU+IrPeLrXF4Ve4UxgpA5Gn+ubBTizcaH+AY6KdqdA=;
 h=Date:From:Subject:To:References:In-Reply-To:From;
 b=q1AEQ3Fgf2YYoLzak3f/bBgqHgf/b9NVnPEfZhOqk0hnZ2igt98MZ8wPmNz8TjapF
 w5fsjGSFIIQiv7d+S6RNEZhK8de5Df9leng/XUkwcDnM+NIIrq1CnPPyzKhuetWiFK
 QzxLgRfAZtMqGFmKB78ehK6sRK2LPX0Pz4eeuLmn4oeFz+Yl6iGBaW6KqLcChK3mC2
 YRnLe+iSKU1LxkbTmMnp3hzJ61GbGg/EQKbCQiurBRZjNt230RiUdXwFcYtDL96urJ
 gxal3GeqOR++VIDcCxsFF6iIRVPiWZq/nQDsSC2V3syOOPjLFaeLac9wNX30Oa513G
 +pDD9foH8cuVg==
Message-ID: <08227725-014f-4b96-975b-58784d9b91cc@catalyst.net.nz>
Date: Wed, 22 Oct 2025 21:55:22 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Samba 4.22++ - RENAME_NOREPLACE w/o fallback?
To: Heiner Lesaar <heiner.lesaar@googlemail.com>,
 samba-technical@lists.samba.org
References: <CAHCztZtZZGnEUS11oDhmSdZ1er-4sXEAtb6mb+hcBYPXn4X0Dg@mail.gmail.com>
Content-Language: en-NZ
In-Reply-To: <CAHCztZtZZGnEUS11oDhmSdZ1er-4sXEAtb6mb+hcBYPXn4X0Dg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 18/10/25 02:01, Heiner Lesaar via samba-technical wrote:
> Dear samba-technical,
> 
> we noticed after upgrading from Samba 4.20 to 4.22.3 (and later), that
> directory creation on MacOS causes a weird folder creation "loop" when
> creating a new folder in MacOS Finder. Finder basically forever keeps
> creating new directories.
> 
> This is only when the underlying filesystem is BeeGFS, a parallel
> filesystem which does not support RENAME_NOREPLACE.
> 
> My question: Is there a mechanism to tell Samba to revert to previous
> behaviour of not using RENAME_NOREPLACE if the underlying filesystem does
> not support it?

I think that is unlikely. What we want is to get this logic right.

> I´ll copy their analysis here, running strace on the smbd process:
> 
> The problem seems to be at the end of this folder creation sequence:
> 
> 268306 10:18:32.645081 mkdirat(27,
> ".::TMPNAME:D:268306%13947819943702811000:untitled folder 3", 0775) = 0
> <0.000574>
> 268306 10:18:32.645728 openat(27,
> ".::TMPNAME:D:268306%13947819943702811000:untitled folder 3",
> O_RDONLY|O_NOFOLLOW|O_PATH|O_DIRECTORY) = 31 <0.000026>
> 268306 10:18:32.645805 fstat(31, {st_mode=S_IFDIR|S_ISGID|0775, st_size=0,
> ...}) = 0 <0.000034>
> 268306 10:18:32.645899 fstat(31, {st_mode=S_IFDIR|S_ISGID|0775, st_size=0,
> ...}) = 0 <0.000022>
> 268306 10:18:32.645974 getxattr("/proc/self/fd/31",
> "system.posix_acl_access", 0x7ffe67cad620, 132) = -1 EOPNOTSUPP (Operation
> not supported) <0.000038>
> 268306 10:18:32.646082 setxattr("/proc/self/fd/31", "user.DOSATTRIB",
> "\0\0\5\0\5\0\0\0\21\0\0\0\20\0\0\0\0\274(w\2769\334\1", 24, 0) = 0
> <0.000199>
> 268306 10:18:32.646423 renameat2(27,
> ".::TMPNAME:D:268306%13947819943702811000:untitled folder 3", 27, "untitled
> folder 3", RENAME_NOREPLACE) = -1 EINVAL (Invalid argument) <0.000167>
> 268306 10:18:32.646656 mkdirat(27, "untitled folder 3", 000) = 0 <0.000637>
> 268306 10:18:32.647406 renameat(27,
> ".::TMPNAME:D:268306%13947819943702811000:untitled folder 3", 27, "untitled
> folder 3") = -1 EEXIST (File exists) <0.000211>
> 
> Samba prepares the new directory in a temporary location that is probably
> hidden from the user to make the actual directory creation look atomic by
> renaming the temporary directory to the actual one in the end.
> There is an error with that renameat() which fails with EINVAL because
> RENAME_NOREPLACE is not supported in BeeGFS. This error is not communicated
> to the SMB client though.
> 
> Instead, and I don't understand why, it then continues with a mkdirat()
> (which succeeds) and then another renameat() to move the temporary
> directory over the just created directory. This combination of operations
> results in an exisiting directory (created by the mkdirat() syscall) and
> then an error to the application because of the second failed renameat().
> 
> Because the second rename returns EEXIST instead of the original EINVAL
> (the actual error), the application then restarts the entire sequence with
> a new name (which also is an antipattern in my opinion).
> 
> 
> The same operation on Samba 4.20 just succeeds:
> 
> 311932 12:09:08.940014 mkdirat(25, "untitled folder", 0775) = 0 <0.001351>
> 
> Many thanks for your assistance! This issue is keeping us from updating
> Samba from 4.20, which is important due to the AD related security fixes
> introduced in Samba 4.22.3

https://gitlab.com/samba-team/samba/-/blob/master/source3/smbd/open.c?ref_type=heads#L4716
is where we try to handle this, which follows the sequence described above.

The comment at line 4736 says "renameat() is able to replace a directory
if the source is also a directory", and Posix[1] agrees, saying:

    If the old argument names a file that is not a directory and
    the new argument names a directory, or old names a directory
    and new names a file that is not a directory, or new names a
    directory that is not empty, rename() shall fail. Otherwise,
    if the directory entry named by new exists, it shall be removed
    and old renamed to new. In this case, a directory entry named
    new shall remain visible to other threads throughout the renaming
    operation and refer either to the file referred to by new or
    old before the operation began.

[1]https://pubs.opengroup.org/onlinepubs/9799919799/functions/rename.html

I am not an expert in this area, but it seems possible that BeeGFS
fails to follow the standard.

I am guessing the patches for
https://bugzilla.samba.org/show_bug.cgi?id=15693 are relevant.

cheers,
Douglas

