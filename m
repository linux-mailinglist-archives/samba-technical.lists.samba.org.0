Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1418C1BEC76
	for <lists+samba-technical@lfdr.de>; Thu, 30 Apr 2020 01:13:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=XV0HjaeuZO17HljXxWTLh9SP7+M1xfiA6iHGYiG+4sw=; b=ZTZGIEaCOmN3vU8jQvh/wNhEm5
	cI4qbo21KT903ionVfM5es4FxKGUmvrvc7EzJtrU4LuWXXlq31isuNHoXyHoxGRdDTmx08bgfbPxv
	kzYqTNsSizbQlu7ZxdfPR4eyRKspiR7Uv3IAKVpAb2nC+PCCKjjj5dIAVIucEXruFF15OXN9BwAjq
	xVAsIGevCj3OytiblB8V1lzmBt+63TizELnVfGmurs3k7SHpnysr9aOWi40SBwybD0nMt/dyhGhyp
	TddXaMlKAQqlu2+mA8mXJJZvr2Rm8t+n14PqfacXp4+u4SM6SUFT0YgmHyj6+lefKbf9wE2a2N0A0
	U6SEF60w==;
Received: from localhost ([::1]:64856 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jTvsv-0001MS-G3; Wed, 29 Apr 2020 23:12:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54752) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jTvsi-0001M3-9D; Wed, 29 Apr 2020 23:12:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=XV0HjaeuZO17HljXxWTLh9SP7+M1xfiA6iHGYiG+4sw=; b=1vdOs1a3EV4cXbrk+1pupOrHQ6
 80abhH2VhaHsgvbWCqFPB1MN0CBqwySEWWbDzzYC5Xtj9MdE1cSbfHpXHqWA15FOjvYHEr8nji7ox
 rYZz2iCG1lQSrv/K2f1RoyV4JJybM5mDqUxt00dYKT/mi2kkYiutSqBQ+T9dYunlebh4eqSkf6yzc
 xqZK98CNHfvDnFmSNbXSgPJ7ow9eN4B+rDWgCppJ9zbulc9f96m+X8RVu8B3Uyi42mWSxAQQ8Tsrg
 fFnWBAXGDx5ysY7HmA+1ZcUhKnAYTvaAdWzPAqG17X9bPISKvx5QbAdbsmlSp5nAjEK6SeCessHJw
 GCpwk1sBiBqvoKFHR5Jn3KCZjA0YA/ToRBM42dJhN683ox0M1Y+NSrWNWbW1SMxBUYBK9BffbcDVR
 QatLuhEaJbOElFQbZvRCla1+DVuF0iKmiK5fk2rcSkFSFqXn4dldXVnw7mLdlX+I4NiFkkFccxWnh
 O74gS1d7WW88hnTVKO7OAwgr;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jTvsh-0001iv-9F; Wed, 29 Apr 2020 23:12:43 +0000
Date: Wed, 29 Apr 2020 16:12:37 -0700
To: samba@lists.samba.org, samba-technical@lists.samba.org
Subject: Copyleft and the cloud - my talk from the 2020 Copyleft Conference
 in Brussels.
Message-ID: <20200429231237.GE4894@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: jra@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

(From the shameless-self-prompotion dept. :-).

Don't know if anyone can remember the olden days when people
could travel to conferences :-), but here is the
video of my (deliberately controvertial) talk
=66rom the 2020 Copyleft Conference in Brussels
on Free Software, Copyleft and the Cloud.

Other Team members suggested this might be
of broader interest to Samba users as it
touches on some of our issues, so I hope people don't
mind me posting the link !

https://archive.org/details/copyleftconf2020-allison

Cheers,

Jeremy.

