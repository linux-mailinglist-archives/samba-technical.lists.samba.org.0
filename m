Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F4B7AFA9
	for <lists+samba-technical@lfdr.de>; Tue, 30 Jul 2019 19:18:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=ysDyz175bii9Zt76cRQFpWxWzKK+fbp10HVyKWeFkkc=; b=eUOnlGfYIaYpPpujOfd9PbDOs9
	I3qlt84fIVW5L/CLE7TrMYCe3ACLepxG4Xr4D/v6G8QByhOhDxLVopQegQ+080Y02xpAofV9lrXK7
	ZnW1deF3+QEHiuph3aSPwE9lWa+ShcJju/29mswaDfcXy3KbQtDwNXuflmDRRFhXjf7NfBREmvD8x
	ZroibVBSDrBVIMXyHMKj0JeON9gcyxcmgT5wHoFlkP43tNMpi0Q3YJst7EwZvY4Zr93g7mwfWO7MW
	sfj65+i5fj0yoO23Tx002eho3uj9yZuI+rP1ZYbz/VHf9DrSdxSsYPA0FTkNxZgafB0BxqNiAwt9g
	JVuNIdDQ==;
Received: from localhost ([::1]:37214 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hsVlp-001360-90; Tue, 30 Jul 2019 17:18:41 +0000
Received: from relay3.ptmail.sapo.pt ([212.55.154.23]:45795) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hsVlj-00135o-Ox
 for samba-technical@lists.samba.org; Tue, 30 Jul 2019 17:18:37 +0000
Received: (qmail 785 invoked from network); 30 Jul 2019 16:51:53 -0000
Received: (qmail 18176 invoked from network); 30 Jul 2019 16:51:53 -0000
Received: from unknown (HELO [192.168.8.105]) (medalist@sapo.pt@[89.214.19.23])
 (envelope-sender <medalist@sapo.pt>)
 by ptmail-mta-auth02 (qmail-ptmail-1.0.0) with ESMTPSA
 for <abartlet@samba.org>; 30 Jul 2019 16:51:53 -0000
X-PTMail-RemoteIP: 89.214.19.23
X-PTMail-AllowedSender-Action: 
X-PTMail-Service: default
Subject: Re: Turning off SMB1 make slashdot and theregister !
To: Jeremy Allison <jra@samba.org>, ronnie sahlberg <ronniesahlberg@gmail.com>
References: <20190710225121.GA142072@jra4>
 <CAN05THQ65himSVSYpzypUwDeJoaV6FPAhQpV4NEeCT3fRaBxFg@mail.gmail.com>
 <dc0d693a2caf311097cf9a0ef8df3add01117ba7.camel@samba.org>
 <4efb83c3-6df7-af2c-798d-b4ec681562ab@samba.org>
 <8219d257b2fe68717939d2f41566ae669fab8466.camel@samba.org>
 <CAN05THQZVBic5xhXNVixp90UfeWz1rt=mF6F0ZXN6aHFCkZmKA@mail.gmail.com>
 <20190730163237.GC128128@jra4>
Message-ID: <ad9a941e-539a-b864-542f-01a804bbc88b@sapo.pt>
Date: Tue, 30 Jul 2019 17:51:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190730163237.GC128128@jra4>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
From: miguel medalha via samba-technical <samba-technical@lists.samba.org>
Reply-To: miguel medalha <medalist@sapo.pt>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

> I'm working on modernizing the fileserver VFS right
> now, and the requirements to keep SMB1 working are
> causing massive amounts of extra work.
>
> If we can ditch SMB1, many many simplifications
> become possible in the fileserver code that require
> enormous effort today. Take a look at the directory
> scanning cleanup fixes I'm going to try and land
> this week - 99% of that is fixing up old SMB1
> code that is simply unneeded if we were SMB2+
> only.
>
> The AD-DC codebase moves forward as rapidly as
> possible to match current Windows needs.
>
> The fileserver needs to be able to do the
> same.


Maybe I am saying something stupid, but why not encapsulate the current 
state of SMB1 and make it a VFS module presentable to the SMB2 layer?


