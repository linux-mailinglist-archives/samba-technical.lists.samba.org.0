Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2B622A6E4
	for <lists+samba-technical@lfdr.de>; Thu, 23 Jul 2020 07:24:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=KTJaUaiO66yKvNCUL4YHEPMIHZiyO3LqDTDAz1LGN/c=; b=Es2ZONFgR30C04C6XrbLcC/7+N
	I1Hbd635FCFP0YlP49IkOqLMRAhI6UTmslrAlI3Jme1l4KHiTuF99Ub9CtcZQYJr9uBsafF1/alLc
	MVR340Pt8w8j4S/S1zQ0qpzqruprmJT2rBI/qc3HjGKkMROcc7CtpJgQKqadWhe3+Xw50mEhr3BrU
	QPPF2tsQRzBsGFi8ueddnr6Y7HEtc356pt6YzZuWlgHdQXxuUFmQM72K6QldMV71hFv/XOd5RXlRi
	hDsIPRq+GeWmvKMLqqFiiFQBuK9LU2T1l2QhzQKK2g+UEhKXQu7oXKYOiiGxgnjPsHY+t9W6PTWVI
	PqB1E1fQ==;
Received: from localhost ([::1]:21336 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jyThD-009Hei-HA; Thu, 23 Jul 2020 05:23:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41894) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jyTh6-009Heb-TY
 for samba-technical@lists.samba.org; Thu, 23 Jul 2020 05:23:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=KTJaUaiO66yKvNCUL4YHEPMIHZiyO3LqDTDAz1LGN/c=; b=rUSJ8JLDwE1IgqRbUmFhN64syt
 4dqR907NCxgJXQFlwjvkgfiu4L8RrjzwRaYlSdrZ/uP4gEyt5u3P94ZR9HoGr9O2WRy1/Cfrcossz
 Blxim6g5NC5fBRnHj2kE5FfEuqyuDWdDYh/rAruOBj15gCY4rVhYbPGuceDRHZLrUh5KD2QT+9aUC
 TOWz2EFxz0K1BRvf8YbunPklkV04jykEyqV9ZIkRsnuFh9/lTUU1teAn4g3ctFwpTiZhW2gzxdoNu
 oA/qFVrSwUxyOqeL0pQCDafP9VpF29I39CYYANH1wSar5KkVFX4wvowHgnrNfgxw3RgACPED1NFAq
 VwP3XgcrKT6T4XM9JHxb1a4wSLBljm+nVMC7wg5WPW7WJP73Jiefg5WJmq6K27Oln83o4gmHCzeh9
 7Q5djx/YoPPS2gfTK+cTZGIMCQ7knNobi8A9V+CwKKaQX54i8KHEtHRhwg1+V6oxdy24iHvEykEbK
 Fxco/oV365EflbgJMwJ0uR7m;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jyTh3-0007jM-JQ; Thu, 23 Jul 2020 05:22:57 +0000
To: metze@samba.org, slow@samba.org, Andrew Bartlett <abartlet@samba.org>,
 Samuel Cabrero <scabrero@samba.org>, samba-technical@lists.samba.org
Subject: Re: Massively excessive DNS lookups in ads_XXXX code.
Date: Thu, 23 Jul 2020 07:22:57 +0200
Message-ID: <7713308.QliZi8XY78@magrathea>
In-Reply-To: <20200722222945.GA3385@jeremy-acer>
References: <20200722222945.GA3385@jeremy-acer>
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
Cc: Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thursday, 23 July 2020 00:29:45 CEST Jeremy Allison via samba-technical 
wrote:
> Hi all,

Hi Jeremy,

> Do you concur ?

Yep :-)

Have you ever called 'net ads join' in a big network with 200 DCs? Once we get 
the list with DCs we will resolve *every* name we got to an IP address. Yes, 
one would be enough. If we run into timeouts (30sec) a 'net ads join' takes 
about 5-10 minutes to succeed.

Take a look at the while loop in discover_dc_dns() :-)


Thanks for looking into this! ;-)


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



