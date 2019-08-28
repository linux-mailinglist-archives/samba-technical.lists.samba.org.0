Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB74A097D
	for <lists+samba-technical@lfdr.de>; Wed, 28 Aug 2019 20:32:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=sYwZXgUwvDn0lM7SIkA8H7cgSgRqccr1r9cgfz5izEk=; b=ptVst4Qu0JvjawfuN1JPPSHZcC
	7qFvZFELI1dYQfJRPSIlnsEVjAt/P2jBbRWEHCq+tudwITR84kqOtLPSQLlIgKu+XunpwoU+eteqO
	F/3TKUcP3Jij1abISgegyJtbEE9kQORpB3O5RNAEE4fh5QX0jS0mWiF5UUcyrv3pENS4GjZspbqet
	T2HOMS92abe6tGQgKRN5JamHPdXboDikw4G76R6E9is/m6QVR6ydd+f2KXeyazvcQfgbdVQuotmmZ
	vOxyWc5/DRUeSxbiVlnXIoNRFpUMuEoukhBbblzilrdZ1pauNHHw0jcikowmbWyqRRPnkSwNiAq2F
	M0oCXYSA==;
Received: from localhost ([::1]:35450 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i32k0-0003Pz-5R; Wed, 28 Aug 2019 18:32:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:39592) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i32jv-0003Ps-S2
 for samba-technical@lists.samba.org; Wed, 28 Aug 2019 18:32:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:To:From:Message-ID:CC;
 bh=sYwZXgUwvDn0lM7SIkA8H7cgSgRqccr1r9cgfz5izEk=; b=ssHTR1WlsMMdjidbQslQowvWpJ
 b2EbOVC1FJRolqmlKLjOUx73wIbQKc1Z+y4t8924fVybesuFswo+yz1sHtwoufBz2l7wl7k+uxMAU
 WEh/hUAcTz6BvnDVJ6UsUvPu1OTQVJqKF1VtbmPohV9FzDH1zHO5T27s2uOz7x3Adjio=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i32ju-0001gg-O6; Wed, 28 Aug 2019 18:32:15 +0000
Message-ID: <ee7ef5951ba67e788cff73811a29cda46afb7356.camel@samba.org>
Subject: Re: [PATCH] re-add pidl install
To: =?ISO-8859-1?Q?G=FCnther?= Deschner <gd@samba.org>, Samba Technical
 <samba-technical@lists.samba.org>
Date: Thu, 29 Aug 2019 06:32:11 +1200
In-Reply-To: <a4cd67f4-ae87-1ac4-7053-1946a19bf7b0@samba.org>
References: <a4cd67f4-ae87-1ac4-7053-1946a19bf7b0@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Wed, 2019-08-28 at 19:08 +0200, Günther Deschner via samba-technical 
wrote:
> Hi,
> 
> attached a patch to re-add the pidl waf install. At least openchange,
> although a dormant project atm, requires pidl to be available in the system.
> 
> https://gitlab.com/samba-team/devel/samba/pipelines/78660819
> 
> Please review & push.

If needed, why can't it use the perl MakeMaker makefile based build
that we have tested in autobuild?

Also, please use GitLab merge requests for patches to Samba, for
consistency.

Thanks,

Andrew Bartlett
-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



