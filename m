Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6912C36EC7F
	for <lists+samba-technical@lfdr.de>; Thu, 29 Apr 2021 16:39:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=QwGeQVLdIqp5wkNGlwrojvF5IiHhymax0vI8esm3M6g=; b=nh6/cBVEaD5EA/8cW0N0dVm5AI
	88GoDlItG4uOBEiHBSf0HfgbzFC7Kx1jFPhnpoZRq4AgLXjiBYbYPQgpgm8v5K8BqSv74zC+Jmg5E
	0weBMBKgQ82iAGZEpkpdiF3Kd79D/0LIVSD6V/yUZGBr7D/DGMk6vymLsJLLL0OHSYKgAfhjSRAy7
	LnW6rSfUwtMvk2zzQ52cVQEL0qPiPO59rXwbT4faTOAQ/nIir0VZ5iF4DsSE+PZ4cDQC18+pSbiAk
	OYQPvyG40c5XskdIfnukMpCHAkMz9sBMV4bLtYhRwyAUnNpfZPWX1WtSebZwyoMc57ki5rlMZzzv8
	hW9fChQw==;
Received: from ip6-localhost ([::1]:53662 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lc7od-00DBaF-2z; Thu, 29 Apr 2021 14:38:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45390) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lc7oY-00DBa8-Sa
 for samba-technical@lists.samba.org; Thu, 29 Apr 2021 14:38:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=QwGeQVLdIqp5wkNGlwrojvF5IiHhymax0vI8esm3M6g=; b=Hf+MGHdYJqHrMVLahL8XebgZ1t
 1efmNI4xkz8OtEGKsoPwdM138wjIx0bKrDsiMwM+bh+QXquR80/kjvU+PWDoxiX+k8ACj6bsUGlYk
 E8QemBB1GdaIX7WZT6gzXbA9Ge61iugxrJLINqTYsIfGsJ0or2eicpwQZOjxPNs2aTDCIV0LjAxbm
 2u0O9A1hebgjkvf8H2ugbVnMrzGkbC1MfS01LyIoMOdXH1OHd/DgjkZ8WB9+eFWE+dCg3oKEN5+Ik
 BJdauLNvCTIjsGRPzFc1iwj6A0twmlFynFnYjbrT+RyKeswIio+zME3dDj2IVO2JlirnCl9Z+x/FZ
 ek6RN4XT5jrbQeKYrL9qvDHhsFj18qx38K5sANEOaXG62Oe9M+b9RJ6EIE8wuxi1ezeoFCXQQn2ID
 hlYHfJVaSV4/HKrjn14QhL9+UTAC8XgmZS8RDeuYV6EIue1FusptOG4YyYccwiB2WSsKz2B2f1TMp
 bO+QsT5eBfG2zASpTKZn85pD;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lc7oX-0005ge-Uo; Thu, 29 Apr 2021 14:38:50 +0000
To: "'Rowland penny'" <rpenny@samba.org>
References: <YIaZmO3WleOfenUn@pinega.vda.li>
 <vmime.608ab327.345.7841bc1123a20017@ms249-lin-003.rotterdam.bazuin.nl>
 <1d705810-cb2b-4012-6431-bf92cd5b213d@samba.org>
In-Reply-To: <1d705810-cb2b-4012-6431-bf92cd5b213d@samba.org>
Subject: RE: Ubuntu's ADSys
Date: Thu, 29 Apr 2021 16:38:49 +0200
Message-ID: <E85A0E756A8A4AB385CA655415709795@rotterdam.bazuin.nl>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Office Outlook 11
X-MimeOLE: Produced By Microsoft MimeOLE
Thread-Index: Adc8/Rnr3JmUm+kkTva3Blnh0LCkHgAAC3PQ
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
From: "L. van Belle via samba-technical" <samba-technical@lists.samba.org>
Reply-To: belle@samba.org
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Ok, i'll look at it later on, for a desktop, which in general dont have
samba its an option maybe. 
Even if we dont like SSSD.. ;-) 

Greetz, 

Louis


> -----Oorspronkelijk bericht-----
> Van: samba-technical 
> [mailto:samba-technical-bounces@lists.samba.org] Namens 
> Rowland penny via samba-technical
> Verzonden: donderdag 29 april 2021 15:39
> Aan: samba-technical
> Onderwerp: Re: Ubuntu's ADSys
> 
> On 29/04/2021 14:22, L.P.H. van Belle wrote:
> > Hai Rowland,
> >
> > Do you think its usefull to have it in Debian available?
> > And if yes, ... Well, you have the fix ;-)
> 
> 
> I was curious why something that had just been released with 
> a big fan fair, didn't work, so I decided to find out why and, 
> seemingly, I have. 
> The problem, from a Samba point of view, is that it depends 
> on sssd, so > precludes the use of Samba. 
> If 'adsys' can be forked to use Samba, then that might be an idea.
> 
> Rowland
> 
> 
> 
> 


