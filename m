Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3521B11E85B
	for <lists+samba-technical@lfdr.de>; Fri, 13 Dec 2019 17:31:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=ms6fdekbhuPStdaOyKhy32QMqUK0k7saujIpwO8imj0=; b=CtJ33kQ/qQ7pBZ0/+UC1Ja3DGW
	EUSrYMDN3HEFV5NAJrWCBO/deAcYEOkSDLQkz3xtelL6akx9QEFUtegzCG4lWFDtSD+DBhL9okACq
	cr6QTB8xXTA5FJzwn76fNSddR8vkFkPZM9ZZSd7qLdSBYl5uZFdcFmvwjaWQocvAzQbm6Co7i0Uc3
	ePNdkOKR9ilGL8vSpCe7My6Yw/b3AXJE4ouGLJLvuTNwyQaSnfWsXtbwm9zRDKHBna/75Lf4k9yOH
	7FuBdj4OYEX/hoMqoeGup/P+0Sm9F0InHBiGuEEZR71Bm+EiE/cC1AkUeOuRF67blv8xAYhInKB2H
	+J9u80Rg==;
Received: from localhost ([::1]:27666 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ifnpS-007DfX-Lx; Fri, 13 Dec 2019 16:30:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42206) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ifnpO-007DfQ-PV
 for samba-technical@lists.samba.org; Fri, 13 Dec 2019 16:30:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=ms6fdekbhuPStdaOyKhy32QMqUK0k7saujIpwO8imj0=; b=AmTC+evxo88qBR/ifto1B3Iwxe
 JbaC8pkhOmi1VBy6JhHozQdbmqIa0D0Zft96Pqvm1qHBFJEWBEc8tNaYoTbEHUURfECXw6jIWEZBu
 N0ErHe6zRCgAX+HDNgHcqabQjbJIGOwH/bmPN+YvLHIatPBlDWn/HtbyZvLIKynqkLTVZyIXSE4Z4
 f/e1Cb/5EaWFhtxM2Em/csitJAf2o91jwdBbbAgaNmOiafzvMijjx/bs+ePc62NAyE+XMwO88uems
 O6Ti8FUi57GzaRrg9byoFTnqoITSwfmvdxZXW7YnNKk7/SJy9bxXU97DoDK0MdUBuWTI8jTRil31c
 3DsGhqLqZHGbm7yI0bqRJJDm4oVQAAcYCdWdFKqnLIVypgSs2JY8vNahaCSSv3NiOfPf6oPf0sWNP
 oX2vxR2m6O0a0F+xziY8YfJbp+gzfrcAwOwN3bhbAkQ/tABzzRrzKGk6A0dt21ShdijYy9jaBxCBn
 1POlvVQGKxylkxA/yYJ9nlSW;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ifnpN-0004vb-CJ; Fri, 13 Dec 2019 16:30:05 +0000
To: samba-technical@lists.samba.org,
 Christopher O Cowan <Christopher.O.Cowan@ibm.com>
Subject: Re: Parse::Yapp::Driver on platforms other than Linux
Date: Fri, 13 Dec 2019 17:30:04 +0100
Message-ID: <3526762.uABzyUzPJK@magrathea>
In-Reply-To: <0265138D-48A2-4188-8B02-7D90551219B5@ibm.com>
References: <9ff45788c1634239b78dea68d22e4fad@ibm.com>
 <7b03dac06c57cb6c0954861964c9d98a014888ac.camel@samba.org>
 <0265138D-48A2-4188-8B02-7D90551219B5@ibm.com>
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
Cc: Jeremy Allison <jra@samba.org>, Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Friday, 13 December 2019 16:27:52 CET Christopher O Cowan - 
Christopher.O.Cowan--- via samba-technical wrote:
> I should probably mention that I needed to port jansson and cmocka to AIX.  
> (Also needed  a current cmake in order to build cmocka).    I believe you
> can disable the former using --without-json, but I see no mention of cmocka
> in your dependency list.    I haven't check lately to see when and where
> it's required.   Is it only developer mode?   
 
cmocka is required to build our unit tests. Also there are lot of projects 
using cmocka in the meantime. I think we always build the tests, so you can't 
turn them off.


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



