Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 399A11E07AD
	for <lists+samba-technical@lfdr.de>; Mon, 25 May 2020 09:20:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=5zeeOgQcj4goccIbMkkJVC1WUz8OurO3RKSylmCAJgM=; b=kXZmlQYtRutSUeJivh4xq8RVlw
	Yp1XFmiLiBO1F4Rl+dOkrus67FAevmb7Cyu2TfBRnSDjF60ndojEnbVFLmmi5yxQWi13YLD3ZGwrt
	TDXsY1Q5le+eyC70ywL3SZEtrUezqIi1gr5vu9D756LnCOX2wxPP8xMeUm141k8DFslX+a9JRsRVU
	0KZ21m9aWtR7Te41xbi/h1FzS5qdH/9v5B3n9XYcw7oARJmCHw9rW3hsvOAx9a5O82MqObk/Ffn/T
	oAW2ZaoYWD75uk0ypOmVb9rcTYQzaNbmxj5AUormd8CpqQyHXuPHPsMfoa/4fG1oTHOzKhR/yNRa9
	dYLGtVWQ==;
Received: from localhost ([::1]:52962 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jd7Oj-005hAu-Fn; Mon, 25 May 2020 07:19:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54686) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jd7OW-005hAi-RW
 for samba-technical@lists.samba.org; Mon, 25 May 2020 07:19:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=5zeeOgQcj4goccIbMkkJVC1WUz8OurO3RKSylmCAJgM=; b=dF6qRGG1SFKWah5Af/OYn+mSfl
 E235QWuqBSO5THOuRHPivuHIC0e0uY9bsOoktqda+q0AB75s2gyFyAc1qIZ4YN93vJxuq8HHujWuR
 iHyE+fY65CyX6SXtDFcDMIIcTVEPz4lZ6fiUcjZfFUDyxNE7EI0OwaY+ZvCjUuFsLgoAlP4HcoQl6
 ol0X60e76uUOl/mJ4DEb9VcO2sxd77l3SJE43bCZJUxCvwZ+i+zS+F7YxT0dQO7lUDaCLEaa+ynL1
 V0/1UhmHjWFrYbxphBnfpYhf1XQtWhlYaGzbCDX3jERqdZv45oxzEkFj9kIQZ0x4O5JTwhI6SI1DL
 QcAZXA8b2IqkDQjKkSmdSKj59P/3GHNEiXDPGqqLvfX/U4q98QU4LirTifqumUkhAbDa1D86U+j4r
 +NLjx520OH6rlbptsVVV71ewt8kNbPmmBQ9Z65T9tojMFW06GH4b7+iE0IP/5ETWpY+KgBFZY/4Xs
 gAbP86uC4mRjad8TGVs7Fdjd;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jd7OV-0005iu-F5
 for samba-technical@lists.samba.org; Mon, 25 May 2020 07:19:32 +0000
Message-ID: <cc3d7f878e51732e8a4ffa2e6384236fc432cfe2.camel@samba.org>
Subject: Marking fixed in bugzilla automatically (was: [Fwd: [Bug 12296]
 79029 warnings attribute "format" is unknown, ignored])
To: samba-technical@lists.samba.org
Date: Mon, 25 May 2020 19:19:27 +1200
References: <bug-12296-1043-hyH6ysgYiT@https.bugzilla.samba.org/>
Content-Type: multipart/mixed; boundary="=-x6QQqUN/9PliMJiySenb"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
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


--=-x6QQqUN/9PliMJiySenb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

One of the things I've always wanted in Samba is closer integration
between our tools.  At the moment we record some metadata between our
tools, but we never don't automatically link it.

As an example of what we can't do right now, in my ideal world we would
do merge requests in GitLab, which would at automatically close the
merge request and include all the right status info etc.

So much for what we can't easily do, but what if an update to git
master caused a message to be put in bugzilla on the mentioned bugs?

I'm not entirely sure, but I think we could do it with a cron-job (much
like we use to push to GitHub) pushing to a repo running Gitzilla:

https://github.com/gera/gitzilla

I'm thinking we might be able to have a script look for BUG: and
just record a message like Björn has written, possibly with a full URL
to our GitLab or GitWeb?

Anyway, I'm just blowing hot air - I don't have the time (or minions)
to do this, but it would be really cool if we could have tools like
this.

If someone wants to take this further then please feel free to be in
touch!

Andrew Bartlett
-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba



--=-x6QQqUN/9PliMJiySenb
Content-Disposition: inline
Content-Description: Forwarded message =?UTF-8?Q?=E2=80=94?= [Bug 12296]
 79029 warnings attribute "format" is unknown, ignored
Content-Type: message/rfc822

Return-path: <bugzilla-maintenance@samba.org>
Envelope-to: samba-qa@samba.org
Delivery-date: Mon, 25 May 2020 06:51:29 +0000
Received: from [2a01:4f8:192:486::6:0] (port=27220 helo=hr6.samba.org) 
	by hr2.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
	(Exim)
	id 1jd6xL-0005aK-N1
	for samba-qa@samba.org; Mon, 25 May 2020 06:51:27 +0000
Received: from [::1] (port=58424 helo=bugzilla.samba.org)
	by hr6.samba.org with esmtp (Exim 4.93)
	(envelope-from <samba-bugs@samba.org>)
	id 1jd6xG-001Im9-0n
	for samba-qa@samba.org; Mon, 25 May 2020 06:51:24 +0000
From: samba-bugs@samba.org
To: samba-qa@samba.org
Subject: [Bug 12296] 79029 warnings attribute "format" is unknown, ignored
Precedence: bulk
Date: Mon, 25 May 2020 06:51:21 +0000
X-Bugzilla-Reason: QAcontact
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Samba 4.1 and newer
X-Bugzilla-Component: Build
X-Bugzilla-Version: 4.9.4
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: minor
X-Bugzilla-Who: bjacke@samba.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: FIXED
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: bjacke@samba.org
X-Bugzilla-Target-Milestone: 4.13
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution target_milestone
Message-ID: <bug-12296-1043-hyH6ysgYiT@https.bugzilla.samba.org/>
In-Reply-To: <bug-12296-1043@https.bugzilla.samba.org/>
References: <bug-12296-1043@https.bugzilla.samba.org/>
Content-Type: text/plain; charset="UTF-8"
X-Bugzilla-URL: https://bugzilla.samba.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

https://bugzilla.samba.org/show_bug.cgi?id=3D12296

Bj=C3=B6rn Jacke <bjacke@samba.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED
   Target Milestone|---                         |4.13

--- Comment #1 from Bj=C3=B6rn Jacke <bjacke@samba.org> ---
fixed in master with a4041ee6ca942a0117e5454888af5987f19671e6

--=20
You are receiving this mail because:
You are the QA Contact for the bug.=

--=-x6QQqUN/9PliMJiySenb--


