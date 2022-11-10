Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 095C2624C24
	for <lists+samba-technical@lfdr.de>; Thu, 10 Nov 2022 21:49:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=i6kr/WyeNkhqxs16oeYp/s+3oRnYWCPaJEGZRz7vDSs=; b=tY1gaeeXZafJSwy3aBKaJ0TM2W
	90ZN2toReprZTrbL0j0X1jw9FygSbGIbpBJckvBZasYnVP+AHAJtSXgS9SLpnXNwE7fM7osirMQYB
	qYNogzteIDOmpl5AAtm/d/lCSFbrEN99ASGg59t/4WpcODxQo7jmBTig0mqjorQmXLjl7q6BGkf9C
	1WhFfm46bCwtaPG+cVyhcF5JX3Y9eZr9ORw6Icjr87kTeHu+zt1Mm/eI6TFPOrgRMhvwOmoiznb4O
	+NGjGFS0epITjYGINh03s7nxPmjf43TyMchYZuRYeeLyMv/ZjqRNe6K4l2EKqnKA/ko2Dvx7VXGMq
	2+2u7kVQ==;
Received: from ip6-localhost ([::1]:34348 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1otETc-00C4B7-MQ; Thu, 10 Nov 2022 20:48:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54894) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1otETX-00C4Ay-DE
 for samba-technical@lists.samba.org; Thu, 10 Nov 2022 20:48:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=i6kr/WyeNkhqxs16oeYp/s+3oRnYWCPaJEGZRz7vDSs=; b=JjP0kSc+tCEqVI9/DK1G/tH48x
 CBC8JexG7b2Roev2jEYXLAYWTA/l5l38Lqu0E6eK07VjS6aCC7nn9DpnaJCWn8Qymv4wZ7RrexK93
 EIYYLA5WgYd9aHv0b6u2wzbF9JlNoxC1gLtTuXlh3w99Jx77E288esFUJlAsopyu10qxWQVpEHdnj
 bIer3TBkZ/X0sJnSiXWaf7Gi1jxxvBKyLLv8sVhmYcTe+rVU/LeNbAGclm6b9ksQEB4rBUOAzzzDE
 Zon2/C80cjvtjJtAHG8MTyqrduO79HV8uIgpWGLn3qpIQ1X3GajaR5ovKLMWpHC7xx3ZfmuPSvqBo
 vAGjo7NdDkSeG3Dr0uYFOJ7BNpERuJxpFuIQRYIvKJtGU4k7kOM3zY/mBXDz7ZHX1KOvU65iqJ2yo
 P3goM8bpaSvzQ4rriLzFTocNqJacVcp0b4yh3OgylmCcyvpBzbjbxA1K8Nl1J61oC4WKtFrf4r7vS
 VXqI/ieGthb1kYixazygib2h;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1otETV-0083Mi-Tg; Thu, 10 Nov 2022 20:48:38 +0000
Date: Thu, 10 Nov 2022 12:48:35 -0800
To: Andrew Walker <awalker@ixsystems.com>
Subject: Re: FSCTL_READ_FILE_USN_DATA on "SmartScreen" alternate data stream
Message-ID: <Y21joyg1L6gJ9WAo@jeremy-acer>
References: <CAB5c7xqc7BfQ3dCA=Le9izqxzC=bzAWZpYzE4tFUv1N-_Ocfmw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAB5c7xqc7BfQ3dCA=Le9izqxzC=bzAWZpYzE4tFUv1N-_Ocfmw@mail.gmail.com>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Nov 09, 2022 at 12:58:07PM -0500, Andrew Walker via samba-technical wrote:
>Hey all,
>
>I just saw an smbd crash where we asserted here:
>```
>static NTSTATUS vfswrap_fsctl(struct vfs_handle_struct *handle,
>                              struct files_struct *fsp,
>                              TALLOC_CTX *ctx,
>                              uint32_t function,
>                              uint16_t req_flags, /* Needed for UNICODE ...
>*/
>                              const uint8_t *_in_data,
>                              uint32_t in_len,
>                              uint8_t **_out_data,
>                              uint32_t max_out_len,
>                              uint32_t *out_len)
>{
>        const char *in_data = (const char *)_in_data;
>        char **out_data = (char **)_out_data;
>        NTSTATUS status;
>
>        SMB_ASSERT(!fsp_is_alternate_stream(fsp));
>```
>
>Due to what appears to be a client sending FSCTL_READ_FILE_USN_DATA ioctl
>to a SmartScreen alternate data stream.
>
>```
>#6  0x00000008016d13be in vfswrap_fsctl (handle=0x816c73280,
>fsp=0x816c3d260, ctx=0x810398670, function=590059, req_flags=49217,
>_in_data=0x0, in_len=0, _out_data=0x7fffffffdfa0, max_out_len=320,
>    out_len=0x7fffffffe070)
>
>(gdb) p *fsp.fsp_name
>$3 = {base_name = 0x816c3e5c0 "System/Drivers/Peripherals/SoundBlaster
>X3/Drivers version 3.4.98.00/USBCMDMasterInstaller_3.4.98.00.exe",
>stream_name = 0x816c3e690 ":SmartScreen", flags = 0, st = {
>    st_ex_dev = 17440526963365876026, st_ex_ino = 13799128922567319488,
>st_ex_gen = 27211941, st_ex_file_id = 33830, st_ex_mode = 33272,
>st_ex_nlink = 1, st_ex_uid = 1000, st_ex_gid = 0,
>    st_ex_rdev = 18446744073709551615, st_ex_size = 7, st_ex_atime =
>{tv_sec = 1667955800, tv_nsec = 250523235}, st_ex_mtime = {tv_sec =
>1667955806, tv_nsec = 707597100}, st_ex_ctime = {
>      tv_sec = 1667955806, tv_nsec = 707691237}, st_ex_btime = {tv_sec =
>1667955801, tv_nsec = 825131076}, st_ex_itime = {tv_sec = 1667955801,
>tv_nsec = 825131076}, st_ex_blksize = 131072,
>    st_ex_blocks = 1, st_ex_flags = 2048, st_ex_iflags = 6}, twrp = 0, fsp
>= 0x816c3d260, fsp_link = 0x810237480}
>```
>
>Of course, it's a soundblaster driver file :))) has anyone else seen this
>behavior before from client? Perhaps we need to add fsctl hook to
>streams_xattr since this I think asserting here is probably a bit excessive
>(maybe pass along base fsp in this case)?

Can you give the entire call stack. Might be easier to
just change the upper level code to pass on metadata_fsp(fsp)
instead.

I don't think there's a case where an FSCTL/IOCTL is done
on an alternate stream fsp.

