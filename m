Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFB02E8335
	for <lists+samba-technical@lfdr.de>; Fri,  1 Jan 2021 07:02:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=olcpllrnDpJpxDNEbWl///p/trRno4ECZCntLhEm/mo=; b=IU+La3i+V89Tb/OyqXqw0Ym/KJ
	qSqnZPztPsmAGWXpfYYSFTBD8O3h2cWAwiHS6GeH/9vBCwZuGVXPOHJ5bob1lpCXq9iNYETNp6+M9
	UUMVk6mrZdtc8wTCWRbRBlKs8o8B5Waiky57dXRdZCLNtUgYXJZn9p9eze7fY1RHAKg7qC/DJ40HC
	DkctcCDUFvYRf88u7gQJtjVNPAsxxWixgwGr35SXBICZhUzhdBAJtvBrxDNFm4hrSkE4PI/TPoWEp
	OYZbMsTL1OW4DfI+bXu8u9/bjNJNPPKexV3mvhGO9zzT2xn1md7RHK2yESIsRmuw+8K8EkXgaOdWW
	xOQrefPw==;
Received: from ip6-localhost ([::1]:33320 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kvDV7-004SaX-9T; Fri, 01 Jan 2021 06:01:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42158) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kvDUt-004SaP-En
 for samba-technical@lists.samba.org; Fri, 01 Jan 2021 06:01:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=olcpllrnDpJpxDNEbWl///p/trRno4ECZCntLhEm/mo=; b=RgsCtALdN7VoRey/j/TCf4xcUe
 +ZJ2NzaOnck75bobdrpScDFHGttmBV+O/hfizGDFpUz0xgD8iAP6gitPyyyOve1+QzjOyNO0RivB+
 h4FOwHIglm2LTK/Y08XkM23vi3SCDJ0++5QFzIEsgpY8da4XSbeErsO/GBvS2IlAKGF4A8wdkZcAc
 oXKW129KLq0bHWXIc3sBLcnz7970Cx+G0FHKCYGTekaWiQO9iGfp3dd0lENgm6m+0jgVsoib27eR9
 0S6+uSTH3buCsoTrTJx3c5fiaeP70S0qeMksM8a6FWIN5TwLkQb5UsjG28lvtI1QwMAuMnpvQ4uw8
 xYLDLZ79zblETmc1WV3TXUQFB+szKyO4MuyG2LFIF71Fk20y7NYBCb2+eqnraZDTgzJcJRdv6YdiW
 PU/rOn0leh8tz60C1wrLYwbTNZYY+9erd7MhQARy2XuYpj5HKqKWsJ8nBneP+jodMC0MhT58azrb4
 cDnvPIyIR/utoxaUGvtvjUp1;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kvDUb-0001k6-3w; Fri, 01 Jan 2021 06:00:53 +0000
Date: Thu, 31 Dec 2020 22:00:50 -0800
To: Steve French <smfrench@gmail.com>
Subject: Re: [PATCH][SMB3] allow files to be created with backslash in file
 name
Message-ID: <20210101060050.GA1892237@jeremy-acer>
References: <CAH2r5msH3LZuF69UFcfgtG7XXurMDc=-Ab7Ct4XwfARR8d+wRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAH2r5msH3LZuF69UFcfgtG7XXurMDc=-Ab7Ct4XwfARR8d+wRA@mail.gmail.com>
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
Cc: Xiaoli Feng <xifeng@redhat.com>,
 samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Dec 31, 2020 at 09:35:23PM -0600, Steve French via samba-technical wrote:
>
>This patch may be even more important to Samba, as alternative ways of
>storing these files can create more problems. Interestingly Samba
>server reports local files with backslashes in them over the wire
>without remapping, even though these are illegal in SMB3 which would
>cause confusion on the client(s).  Has anyone tried Windows mounting

Samba should mangle names containing '\' to 8.3 names.

The code in is_legal_name() should catch names containing
'\' and report them as needing mapping to 8.3.

Indeed if I check this locally with smbclient I get
(for a share containing a file created with:

$ touch 'file with \ in it'

I see the file:

FI32YH~P

listed from smbclient -mSMB3

Check how you have Samba configured Steve.

