Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A370D0014
	for <lists+samba-technical@lfdr.de>; Tue,  8 Oct 2019 19:44:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=vdiUKCVUKzgdWw6iOgj/sE/d6xmYxe8pfytuPCNx04Y=; b=YyZFwQH1XTUQ7yvUOUP1UOCtP+
	EDm18zL29zpwE6bwcM5BPssCcjpJJTNUPFQkvre0DUumMDreGzoSsfVJTTW/5dbsRhALRWy18HLss
	IiTSddGjaQC1zs5U7sGBTP0l4HIGAZDZt4Q1w/7dwqaq/Wv509sR438DKMrimYDFPqgs3R3/i94Gz
	qnQ6QN67zGMHFrhjxsAhFiK9vJFX5CwJkNO5zDVS2xa/+QtLuUyLvO6/j3hJMAqe5rRxnc6xyGPcO
	VHlNmOMWRHhNC+GsfDNBAkbhqD8cRX/gWSIUGXkFteurU/7KB135PrulNLHD+pnCZLjh/8bG8hZG4
	NkdXo/3A==;
Received: from localhost ([::1]:63704 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iHtVZ-0029bs-Gn; Tue, 08 Oct 2019 17:42:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61584) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iHtVV-0029bl-Ro
 for samba-technical@lists.samba.org; Tue, 08 Oct 2019 17:42:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Date:To:From:CC;
 bh=vdiUKCVUKzgdWw6iOgj/sE/d6xmYxe8pfytuPCNx04Y=; b=kguOZrY4DJfS71Jv3H8zEAkYKL
 15wD3QqGxIsw/Nc4i+vY1UhEwbK32RhXZE8JyMawVxTBVD5h/L9VpIQn+XC4ow/lyWOZnymFa1eWP
 5Rkd39T/ACAkaBffat9VXbDdk6idDU4Zp2rNdOBWf4vUIOJ//5bw10p2RAJVikspQUlc=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iHtVU-0000cC-Nn; Tue, 08 Oct 2019 17:42:44 +0000
To: samba-technical@lists.samba.org, Stefan Metzmacher <metze@samba.org>
Subject: Re: Samba and legacy Windows support
Date: Tue, 08 Oct 2019 19:42:44 +0200
Message-ID: <7864352.Hjom7Gqvmf@magrathea>
In-Reply-To: <d7532a8d-aa6b-4f30-efde-891b7b5b8333@samba.org>
References: <5849953.E8HlOTvGIY@magrathea>
 <d7532a8d-aa6b-4f30-efde-891b7b5b8333@samba.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tuesday, 8 October 2019 13:05:14 CEST Stefan Metzmacher via samba-technical 
wrote:
> > * Can we remove DES and 3DES Kerberos support for Samba 4.12?
> 
> Yes. The question is how to store the keys.
> Is there a way to disable DES on Windows, so that we could
> check what they store in the Primary:Kerberos-Newer-Keys
> and Primary:Kerberos blobs in that case.

Windows Servers with a Domain Functional Level > 2008 do not accept DES keys 
by default. RC4 keys should be present since Windows 2000. See first answer 
to:

https://social.technet.microsoft.com/Forums/windowsserver/en-US/
120efed0-10ad-4f78-821f-38def967f3c5/ad-kerberos-question
 
Also looking at the KDC code we don't handle DES keys, we only support RC4 and 
AES. See source4/kdc/db-glue.c -> samba_kdc_message2entry_keys()

Looking at the code ENC_RSA_MD5 can be removed. We don't really do anything 
with it.

> > * When can we remove RC4 support with Kerberos?
> 
> I think we need to keep that, because not every account
> has aes keys, as the password might not be changed.

Ok, so we have to discuss this with Microsoft.


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



