Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5016326C15B
	for <lists+samba-technical@lfdr.de>; Wed, 16 Sep 2020 12:02:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=AJ0yFR7U7/eGQKzgJ22ytbLyfsiNDtIr1Uqc+m0DbRk=; b=eWQwAcUDqVsXBVGyavQjFXWSyq
	CI8NBz/09dMXXgoZgw3dHiX4KjbxsrWK4E957XeDOjGv1TEnsY5n/5TU9UhptWQJZ7tMj6n173T65
	y56xEwVUO2+eBu9S33qWoqF9/cN4GQmwLLE8sGQqWHo8kqIFNzbO7BMt2u93s/6muRCgSbk6RfWHw
	JbBHmndc2ildlUhrk8rHQ41vpcbOtKfBogNbL5Fcbldgcw6CycMCDGiZ7ZMAiULNpfp1w0qOFUCgh
	OnLPenQ0W8XtRsw3tbBpZaaCT9bgw9/U2l84GjAmIcPaXJNe/1MrFl4jYLQRkOsber3jw+LS6ZAI+
	mKbP5y9Q==;
Received: from localhost ([::1]:33804 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kIUGu-005kqT-Rz; Wed, 16 Sep 2020 10:02:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:33058) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kIUGo-005kqM-TA
 for samba-technical@lists.samba.org; Wed, 16 Sep 2020 10:02:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=AJ0yFR7U7/eGQKzgJ22ytbLyfsiNDtIr1Uqc+m0DbRk=; b=HuqDCdHpyqH1sWpJR0LA3DU/82
 fofJR6FiyKHZSGffrUEXDTe+bHmsLMdOB34aSCjHNFWZEUawDn/8SrhB9XAG3/e85t98x12BDDnkc
 /mQXO/WGvIjUKNT90kP6pW1YesRKxJrl3Lq8MxpRwM5hqxXVys9GcxCkcOIam87J8RFB6jrSIWXuk
 lnS12WPvPNzX1PEeEYj4ZgX00q/Qosb9uZl33U6OrAg3wUtU1Y5wPxUnrPe/1ob/IWQ2o41wWlHl/
 QXG3wfu1WJ+lIT1SqMX+rA/ZgtuNvXzA/FFjPEJVBtbbEHmdL5PWhVEBAjzAYuYXUz6qGTIiIMPw/
 y8m19Fx//256VV3ftGpg1AY4ID9uLd3dd/HozbWFdNsJ/1X/YVkWxBMyBXaBo0dvOiuSHS3tekegZ
 wXBzDdNHXbm29cagayWon0XBOQRz7U0B/3Jj/N4cl3/L2mcSpk9+/KxuEOw8ew6Y44leQsJz/j4/P
 +QrAmB7mXgYIZFo5mWB3K54z;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kIUGo-00031A-1A
 for samba-technical@lists.samba.org; Wed, 16 Sep 2020 10:02:34 +0000
Message-ID: <77397fd0732ef608deade0b3d18c9c58cbdf9ef2.camel@samba.org>
Subject: Re: Ideas (other than just mandetory schannel) for ZeroLogin
 CVE-2020-1472
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Wed, 16 Sep 2020 22:02:30 +1200
In-Reply-To: <9d9c4df7515cb1c42b00e935effd3b91c6c576ff.camel@samba.org>
References: <d415684468ce9d140f570791f6a4d560df9bb7da.camel@samba.org>
 <9d9c4df7515cb1c42b00e935effd3b91c6c576ff.camel@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
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

On Wed, 2020-09-16 at 18:05 +1200, Andrew Bartlett via samba-technical
wrote:
> On Wed, 2020-09-16 at 17:51 +1200, Andrew Bartlett via samba-
> technical
> wrote:
> > This isn't on the bug
> > https://bugzilla.samba.org/show_bug.cgi?id=14497
> > because it isn't at that point yet, and isn't a MR as I've not even
> > compiled it, but ideas (done with Gary) for mitigation for those
> > who
> > must run with schannel are:
> > 
> > Ensure that the password set via ServerSetPassword2 is of non-zero
> > length.
> > 
> > Check the password does not have zero bytes in it.
> > 
> > Check that the challenge in ServerAuthenticate3 does not have
> > repeating
> > patterns in the first 3 bytes and repeating 0s in the computed
> > response.
> > 
> > This should make false positives pretty rare, while working with
> > the
> > failure mode of the cipher.
> > 
> > See https://www.secura.com/pathtoimg.php?id=2055 for a really
> > readable
> > description of the issue.
> > 
> > I'm going home shortly but will keep looking at this and will be
> > available tonight.
> > 
> > I think Samba 4.13 should ship without the option to turn off
> > schannel
> > - just remove it, assuming we can make the tests still go.
> 
> We could also make ServerSetPassword2 absolutely require schannel for
> 'server schannel = auto', impacted servers would still be able to
> ServerAuthenticate3, just not rotate their passwords.

I need to finish up here in NZ for the night, but I wonder if someone
could write up an advisory at least so we can post something to samba-
announce ASAP?

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




