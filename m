Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C4ED3D1BA1
	for <lists+samba-technical@lfdr.de>; Thu, 10 Oct 2019 00:25:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=w7u4T3a9rzUo0ttToWIJT8LsjYX02S0cicHOTGNJ4h8=; b=EPVvMRznKsBDeZq7ddOeyxOsFF
	kWcmOfmfpcipypj4EcCq7PEUaCRCFzjHZtCnWxPCACz1gSgDAbBk2r9LEseLmGxe+/WotKPncx7nN
	D2dP6NcbL7oFpP4HjGczPzr7Hxo5cKjWIhH6pDLvVGFWTKp4WP/Nk7n5VqITdGbGpPMfqe65QOkst
	V65VndDVIiaEG/SvWFLX0rwKo2NYBdFlziD6zSSHSDtmljZg6FIBB5nRzqsyBtPsETJJ5Ez4RIBmt
	kAuaZS3PP24LjUv78yaNwsufWBYF+sGIL2T4+GBRof85N4YRXmz7hcVMCW0DBgSMuX6Oz/vmRkzNN
	K5fcUc+Q==;
Received: from localhost ([::1]:42518 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iIKNa-002USj-Q5; Wed, 09 Oct 2019 22:24:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26490) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iIKNW-002USc-5M
 for samba-technical@lists.samba.org; Wed, 09 Oct 2019 22:24:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=w7u4T3a9rzUo0ttToWIJT8LsjYX02S0cicHOTGNJ4h8=; b=S/umlUiHll3iBcmwZ7KdJhkp7x
 wqs68FBoX5WO3FnNMfQNj5EV8Uvdk6F4F7BQ/MGuCMqz6/81KSsrCn/HSUwynelS0GMy6tY7TnrOy
 ETIv0U4/tnPtqGB2hqD9TyljJ7XkBJJgQZdIP5G3NW8+7tUxzs4CFVQ3TNCRTTIxSfqi9Lq+4w2OV
 nrELVXIbulwic8+KyqLyQca5atEKBtulfG8Z5n91NiIkpuevgk695v0JMsAc+FRLNktmWuVfi3UvD
 y+luJl+r3mbav3gkpi4KlXHlaAOWgXXuAn2nMkh6fDRig3K61M3Zwu1hd9Dj5ezkoc0sJZrUt+LL9
 NFjsz2ohc09pfvbzxgWIgLIrRk1Z2SOE2TEr5isPfzdLzJSemYiZypSpLEFgWztulXGY9nZBz/WUh
 pFCI9I/g8Qi7+aWU8TT7yDeOruuMsSNL46apNBhX5k31zJx84BnllWJthqArAmNYvTU2lUzLvVHAQ
 ADqd9JPgGccS/Y1d+4kPzQnY;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iIKNT-0003rk-TV; Wed, 09 Oct 2019 22:24:16 +0000
Message-ID: <0fb33f9ced490a7ef59d11efd6f9c6348e403d92.camel@samba.org>
Subject: DES with GnuTLS (was: Re: Samba and legacy Windows support)
To: Andreas Schneider <asn@samba.org>, Jeremy Allison <jra@samba.org>
Date: Thu, 10 Oct 2019 11:24:11 +1300
In-Reply-To: <1657858.v60hS3BQgh@magrathea>
References: <5849953.E8HlOTvGIY@magrathea> <20191008182451.GA1583@jra4>
 <1657858.v60hS3BQgh@magrathea>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2019-10-08 at 20:34 +0200, Andreas Schneider via samba-
technical wrote:
> 
> Isaac and I will work on migrating the DES code to GnuTLS so that
> SMB1 still 
> works.

Cool!  I looked at the cryptography but never got a chance to prove if
GnuTLS allowed it.  DES-CBC with an all-zero IV seems to be just DES at
a maths level, so if that works we should be able to just use GnuTLS!

Sadly MSCHAPv2 is so well embedded that I don't think we will be rid of
DES or NTLM any time soon, but I certainly hope we can stop carrying
the crypto code for it. 

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




