Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CC193B0FA8A
	for <lists+samba-technical@lfdr.de>; Wed, 23 Jul 2025 20:58:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Kmu1zcRA/bwvbHArdkWWBKciCfsbIwPAc6xR2xoYwJA=; b=5vq191W/NqJki4B0FqVndjjCgT
	l/3lKfpvoe6mzjDA4rsdwrYfkBceN/jDizj62EBZaCp3aLQcTuDDb3AR7oTvv40n7yjWLqPtPWW9p
	LeaAISi/2jJqSLFXzUzLWogKdTw52vkdsw4xt8kiumVrvoCcycTCRZnlwHJCNWc+BlHg/lin2fJEd
	0P7yEGHKByqku9iFZF5e7GIVnlEaS6ltnMuZJPEfbcygH7lf5Ri+Axnbyaxto//6qgzv4K6kmh1ly
	rt0rrTwiqdnGjE8WEMlrCuO8vjDukTw2IO9iALHcZa+fr1qk0cnVpDcLmuhKMTCQ7uu0bNtBi5Wv0
	HuaCirCw==;
Received: from ip6-localhost ([::1]:62358 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ueeeI-00Bgmo-HZ; Wed, 23 Jul 2025 18:57:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:51042) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ueeeD-00Bgmh-Mj
 for samba-technical@lists.samba.org; Wed, 23 Jul 2025 18:57:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=Kmu1zcRA/bwvbHArdkWWBKciCfsbIwPAc6xR2xoYwJA=; b=m2mLTuZ3MwQkwv78Sh+sD0qPdC
 6/lnzVYJbxVftbdvHktJY2HejYh9g+yHJf9aNc0WlQHYfLLD7y5FgV/fzaoYS8ZfZBSAcC7PC9rZt
 JMsC6ODhGnlro2WuEimfS7KjgqQTlz3iMXQHiqDacqG8REC6S9TEtUdBN64dZY7BDyLN089TSrHYS
 ItUGbr1nayprsEoXx4C0wM4FW4r4xXBTv+Z3wYZlLF5le498AeoVonLCABdAE/6uVXeCC8vRyEQwB
 EBN0Jy19as8qtjTiUsrZOSZzDSEUBbnzweK36rDmNSGfj6O5VdM9gUsQfarV8IYPcB3emtX8KyV3P
 uuTvZtcwSNK9sjl6xocRyVHRl6ZdIGGpuWVyHF8PvKAB5u4r3HOo/dWsesC5X1PFKJSEJo4R97dOn
 Sr569q7lfSVlk7Sz4f5WJR8mklRBSTShxHVO4S8zOU7P1rp8ut7iq7ZiogJaa61qcFQzdtQzUjRSp
 uduus27CrJALqcmE4f70av1Y;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ueeeC-00Gf3T-1s; Wed, 23 Jul 2025 18:57:00 +0000
Date: Wed, 23 Jul 2025 11:56:58 -0700
To: Steve French <smfrench@gmail.com>
Subject: Re: smbclient posix_mkdir over SMB3.1.1
Message-ID: <aIEweiFlFPgdEecb@jeremy-HP-Z840-Workstation>
References: <CAH2r5mvaM2Fuytp9DH3RahQ-W_mQPpi=GBuKET6do1pmyiWT4w@mail.gmail.com>
 <aIBOfm6OKYlATpAs@jeremy-HP-Z840-Workstation>
 <CAH2r5mvEAfDMhNyhzL877EjBsmdBavWeLQaVQKc+gmueUSXrrQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAH2r5mvEAfDMhNyhzL877EjBsmdBavWeLQaVQKc+gmueUSXrrQ@mail.gmail.com>
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

On Wed, Jul 23, 2025 at 09:24:40AM -0500, Steve French via samba-technical wrote:
>Looks like a little bit of progress, but still fails all posix operations:
>
>smb: /> posix_mkdir dir0 0755
>smb1cli_req_writev_submit: called for dialect[SMB3_11] server[localhost]
>Failed to open file \dir0. NT_STATUS_REVISION_MISMATCH
>smb: /> chmod 0776 file1
>NT_STATUS_ACCESS_DENIED chmod file \file1 0776
>smb: /> posix_open newposixfile 0777
>smb1cli_req_writev_submit: called for dialect[SMB3_11] server[localhost]
>smb1cli_req_writev_submit: called for dialect[SMB3_11] server[localhost]
>Failed to open file \newposixfile. NT_STATUS_REVISION_MISMATCH

Turns out there's missing code in smbclient cli_posix_XXX() functions.
Currently they're only plumbed into the SMB1 code.

Breakpoint 2, smb1cli_req_writev_submit (req=0x55555561f260, state=0x55555561f440, iov=0x55555561f4c8, iov_count=7)
     at ../../libcli/smb/smbXcli_base.c:2188
2188	{
(gdb) bt
#0  smb1cli_req_writev_submit (req=0x55555561f260, state=0x55555561f440, iov=0x55555561f4c8, iov_count=7)
     at ../../libcli/smb/smbXcli_base.c:2188
#1  0x00007ffff7f63639 in smb1cli_req_chain_submit (reqs=0x7fffffffd738, num_reqs=1) at ../../libcli/smb/smbXcli_base.c:3123
#2  0x00007ffff7f71408 in smb1cli_trans_send (mem_ctx=0x5555555d2fc0, ev=0x5555555d1d60, conn=0x5555555d2680, cmd=50 '2', 
     additional_flags=0 '\000', clear_flags=0 '\000', additional_flags2=0, clear_flags2=0, timeout_msec=20000, pid=442632, tcon=0x0, 
     session=0x5555555d2990, pipe_name=0x0, fid=65535, function=0, flags=0, setup=0x5555555d4210, num_setup=1 '\001', max_setup=0 '\000', 
     param=0x5555555d42a0 "\t\002", num_param=16, max_param=2, data=0x5555555d4220 "", num_data=18, max_data=12)
     at ../../libcli/smb/smb1cli_trans.c:528
#3  0x00007ffff77bfe16 in cli_trans_send (mem_ctx=0x5555555d4210, ev=0x5555555d1d60, cli=0x5555555b5570, additional_flags2=0, cmd=50 '2', 
     pipe_name=0x0, fid=65535, function=0, flags=0, setup=0x5555555d4210, num_setup=1 '\001', max_setup=0 '\000', param=0x5555555d42a0 "\t\002", 
     num_param=16, max_param=2, data=0x5555555d4220 "", num_data=18, max_data=12) at ../../source3/libsmb/clitrans.c:62
#4  0x00007ffff77acb77 in cli_posix_open_internal_send (mem_ctx=0x5555555dd6c0, ev=0x5555555d1d60, cli=0x5555555b5570, 
     fname=0x5555555dd650 "\\foo", wire_flags=528, mode=511) at ../../source3/libsmb/clifile.c:6172
#5  0x00007ffff77ad248 in cli_posix_mkdir_send (mem_ctx=0x5555555dd6c0, ev=0x5555555d1d60, cli=0x5555555b5570, fname=0x5555555dd650 "\\foo", 
     mode=511) at ../../source3/libsmb/clifile.c:6367
#6  0x00007ffff77ad44e in cli_posix_mkdir (cli=0x5555555b5570, fname=0x5555555dd650 "\\foo", mode=511) at ../../source3/libsmb/clifile.c:6415
#7  0x000055555556680a in cmd_posix_mkdir () at ../../source3/client/client.c:2971
#8  0x000055555556f52d in process_stdin () at ../../source3/client/client.c:6200
#9  0x000055555556f76f in process (base_directory=0x0) at ../../source3/client/client.c:6247
#10 0x0000555555570e86 in main (argc=3, argv=0x7fffffffe188) at ../../source3/client/client.c:6788


