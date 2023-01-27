Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6E467EF15
	for <lists+samba-technical@lfdr.de>; Fri, 27 Jan 2023 21:03:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=xFltNPPhj9CmYj4VzcmTCdibRRDkb0uigX6FdCXruoU=; b=4SAlxIlMXoh2leFQL/rbi76drY
	xUDVLqPdxYcdUW81EQfsThVcLuyolDsuBrjW1eUPf6H2m7LSff3hEGFTbxfJMUUCLrrYyC/aeKp3T
	2YYDbfIHRjJXRYC/h2objjIv6qpUVGALwxqJBCZOF1JKCyb64fpT5Cb0MgWI8L0RXfSY42QlyURJu
	nHtFb/lGw3/txOT2Hsg2XeAO+1scZKb+C75Vvac3A/zhBv2pR/47BYpmIj7PqgMiyYKquHdi4Mr6R
	RzYLpG4f52WBpqGiXLpVKA8U2RLPVjVUKG/sQH62vabrC2AgOc3wq8gCvQ8Tf10wHwb9l+2FPaniZ
	zHw7M8hg==;
Received: from ip6-localhost ([::1]:35308 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pLUwY-003oSf-7k; Fri, 27 Jan 2023 20:03:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48748) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pLUwT-003oSW-S6
 for samba-technical@lists.samba.org; Fri, 27 Jan 2023 20:03:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=xFltNPPhj9CmYj4VzcmTCdibRRDkb0uigX6FdCXruoU=; b=UANOiBIEB8IeD6kG4sav0KWweh
 CvnTeIoqg0h2Rcr5qYoFh8T0/GhIgTdTmbOLnZ5dMVmXRGWT1W1d+BenvdfX+ocD9aSPwlgRiquSK
 GGiZxuQXjzSfM5NoZ5IF18b9QbpRPjaQBEYCwF/gljNeZQr5tLldqs9ZQ/QmgwyUUQeOeb5M73WnQ
 DTlOSem6u9rzJha0xrUEHKtU79ROL+5cE903AE2bPwzjOvoFo11Fr2AnbbIbYeBmzAW+IfWl9w9mF
 47Ek7T+Hnzesd6r8nrAt6eY7tixU5FZWigcuExx0x8jaso1IKgqUcIoTxMqDsopyMD2MnTsIdo6ED
 pOIpvOsYyYAyGWqx0TMIcz++EvLV78tRPNSfEJZqXqJzO0Mf82gCXQZaLHlfTB0tBGt+DPENavAyx
 OA06DjXB4WcZilKaDTxLJPIrCvqKdrvLOd4WBF0NC0JiQF/VloVIX67jIGBB+3KbbI0rL8iWJc55T
 p7qbjMFHnI28bo0AQcsMguT4;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pLUwS-00AYKD-Cb; Fri, 27 Jan 2023 20:03:20 +0000
Date: Fri, 27 Jan 2023 12:03:17 -0800
To: varun mittal <vmittal05@gmail.com>
Subject: Re: Does the CreateDisposition flag of a client depend on Server's
 response ?
Message-ID: <Y9QuBd7wf9hfbpT5@jeremy-acer>
References: <CA+RDaRC68P7Sfa80X9Z6VFyYnrvoxvC-hLGh=X6BQuXJW9jO8w@mail.gmail.com>
 <6b9c96ed-b116-3cdc-d361-44662662626c@samba.org>
 <Y9QgJwNzUh9EQFQV@jeremy-acer>
 <CA+RDaRCMPnsbg9yH9ciO_uPErDm_pKa+_fZtLtu0JbRpPkJUnw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+RDaRCMPnsbg9yH9ciO_uPErDm_pKa+_fZtLtu0JbRpPkJUnw@mail.gmail.com>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, Jan 28, 2023 at 01:27:36AM +0530, varun mittal wrote:
>   > Wireshark will be the key. Compare between Windows server and Samba.
>   That is what I thought and have started looking. Any suggestions on which
>   call in particular, there are so many :)
>   BTW, with a Windows server, the flag is FILE_OPEN_IF

Well that's at the point you know there's a difference,
so work back from that point. Try bisecting the trace
to see where it starts to diverge. No tools for that
so you'll have to do it by hand (something I unfortunately
have great experience with :-).

