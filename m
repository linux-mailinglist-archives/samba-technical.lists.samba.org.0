Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E507843120
	for <lists+samba-technical@lfdr.de>; Wed, 12 Jun 2019 22:53:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=c/3ckYCQIjG+sTo+M+T393SCudeAcV3cVuitvCZMI44=; b=byPoGDEpuPad4yerT2MVWSAAXC
	Apjsctl/JrdRV3/wlvzSVYziB0CJ3ygz9vUtGlEo77Vsub++vy1TpNMqv9oduqe3ECRqwzLhk6MsU
	ZWIjCH5VnsD0SVvuuybYCHtRI7TVDOOhDLuapLz3f1bxvwOl1xT7Nk+E2V6sd8v/IE6TRTrGs77BD
	3ldAAtkdHKb36ZSpZxh8gpsXlBFM8EnGh/KWxYykzhoIwa0Hn2Qn//Bjh+8QnT51E1rpXdSiUUnqL
	a5X75+nzl5H6t7Z1sQD9DP1ZTeDqGlFNGNVONaxEIWNWwS0VU7l6Ptc9brHCH39n/NfmvadJtuNKw
	qk98L4Fg==;
Received: from localhost ([::1]:63764 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hbAEp-001NBt-D1; Wed, 12 Jun 2019 20:52:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37238) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hbAEk-001NBh-Mb
 for samba-technical@lists.samba.org; Wed, 12 Jun 2019 20:52:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:To:From:Message-ID:CC;
 bh=c/3ckYCQIjG+sTo+M+T393SCudeAcV3cVuitvCZMI44=; b=iVJYIDzdD/Qhj7eUVzXFiiTj9M
 38FSVIYCOIF57vP9kG64KCo6+Y7JbsveQ1h6v5tK3lXqdQQnOa54cimc8BkMxAm7mK3zLsdKup3vb
 u1mZz3sG3sufGaD4ctksQtyfjWel177cyqgTehEaCZjrKgWm3AsG/NXvN1qzd/RGh0jg=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hbAEk-0002VC-BU; Wed, 12 Jun 2019 20:52:50 +0000
Message-ID: <52115dfa88ecbb8f13436cdf8d6641d0cda4728d.camel@samba.org>
Subject: Re: ChangeLog
To: Steve Cook <steve.cook@mandsconsulting.com>, 
 samba-technical@lists.samba.org
Date: Wed, 12 Jun 2019 22:52:48 +0200
In-Reply-To: <CAPKK0PPxz7RSLqE4NOmXah6_qvpbwM37XwxYOX035QQ9mi3XGg@mail.gmail.com>
References: <CAPKK0PPaLLXnh5Gu-EHeUGcKkATp4rva4LzcnhCU3SsACMyb4w@mail.gmail.com>
 <CAPKK0PPxz7RSLqE4NOmXah6_qvpbwM37XwxYOX035QQ9mi3XGg@mail.gmail.com>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I think you are tooling for 'samba-tool user syncpasswords'.

Samba can store passwords in GPG encrypted blobs (for plaintext) or
crypt() format (for e.g. OpenLDAP, shadow files, Google etc).

Andrew Bartlett

On Wed, 2019-06-12 at 07:34 -0400, Steve Cook via samba-technical
wrote:
> Can anyone point me in the right direction?
> 
> On Tue, Jun 11, 2019, 2:10 PM Steve Cook <
> steve.cook@mandsconsulting.com>
> wrote:
> 
> > Hi All,
> > 
> > Is there a implementation of a changelog within Samba4?  I need to
> > be able
> > to encrypt and store password changes for a user.  I then will have
> > an
> > external tool that will connect to the cn=changelog using the
> > decryption
> > password so that I can get the clear text password to change the
> > password
> > for the same user in another directory.
> > 
> > Thank You,
> > 
> > --
> > 
> > Steve Cook
> > 
> > 
> > [
> > 
> 
> 
-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




