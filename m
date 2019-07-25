Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 094C775779
	for <lists+samba-technical@lfdr.de>; Thu, 25 Jul 2019 21:00:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=FqtqjGeNI1f3To+0Q9LNjfF5Gbo0fEE7JHcMeuN+OWI=; b=VoRidUxKZHuDTwOpNSK3YzqZXV
	DUVnx3axqX4SSJS0nVG6cBLQtS+mHKw1+vxaBdrgdXS5uJ8TnxiiFO8aRDYBUZeg4FajLkffeQmmO
	Njiybaw2jJ3a9SUUtUWUZOSo3Fi2S1SMKHo1B04iEcSFchXGXsb4HPGO6oKnAl337vJXm9Be10W5K
	CZYh/RWnA0kd8OkpG71PmRKyWppTIYcQFAJ+EcdiICtFgJwaDbzF4CqGV/FO/dhMTdGg4YeakGh1l
	w5jaCfRBDgNxvtH9u3zZvSFtBJ4J/oP+Gnk7sZCToKgAes8LAHEooXINYgy33PB3WGLyKLQub8yB7
	r5faXz1w==;
Received: from localhost ([::1]:18020 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hqixu-000JyO-Tt; Thu, 25 Jul 2019 18:59:46 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:39398) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hqixo-000Jxz-FE; Thu, 25 Jul 2019 18:59:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=FqtqjGeNI1f3To+0Q9LNjfF5Gbo0fEE7JHcMeuN+OWI=; b=M0tkOmUTtzW0fXF5WTqBsJauaB
 3aeFF1PYRQArEFEUUqGxRIBVIKBo5Ulcibtpcw/0mXoVKB9KNHkDjvQJnDMPN/BW2a0NnsPLRDaDP
 METnRTp1J6UANEDuGiO6XYt/1K+5N/55MQsX4Z+VXQK9JN+5nM1AbfK3mKrk/+c33WGQ=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hqixn-0002T6-2z; Thu, 25 Jul 2019 18:59:39 +0000
Message-ID: <dc0d693a2caf311097cf9a0ef8df3add01117ba7.camel@samba.org>
Subject: Re: Turning off SMB1 make slashdot and theregister !
To: ronnie sahlberg <ronniesahlberg@gmail.com>, Jeremy Allison <jra@samba.org>
Date: Fri, 26 Jul 2019 06:59:33 +1200
In-Reply-To: <CAN05THQ65himSVSYpzypUwDeJoaV6FPAhQpV4NEeCT3fRaBxFg@mail.gmail.com>
References: <20190710225121.GA142072@jra4>
 <CAN05THQ65himSVSYpzypUwDeJoaV6FPAhQpV4NEeCT3fRaBxFg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.3 (3.32.3-1.fc30) 
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
Cc: samba@lists.samba.org,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

We can't do that until we provide a reasonable way for SMB1 clients to
connect, probably via a SMB1 -> SMB2 proxy based on the NTVFS file
server (where we had such a prototype until very recently). 

It won't be perfect SMB1, but needs to be enough for basic operation.

I'm quite convinced Samba and SMB1 are critical infrastructure in many
places and while we may dislike SMB1 for good reasons the alternative
is to force such installations to rely on what will in 2 years be an
unsupported and therefore soon an insecure version.  

I'm not comfortable with that as an outcome, so we need to provide them
a way forward. 

Andrew Bartlett

On Fri, 2019-07-19 at 20:37 +1000, ronnie sahlberg via samba-technical
wrote:
> Good stuff.
> 
> Next step will be to delete the entire smb1 codebase for the next major version.
> 
> On Thu, Jul 11, 2019 at 8:52 AM Jeremy Allison via samba-technical
> <samba-technical@lists.samba.org> wrote:
> > In some small way to apologise for linking to twitter
> > yesterday :-).
> > 
> > https://tech.slashdot.org/story/19/07/10/2119238/samba-411-removes-smb1-file-sharing-protocol-version-by-default
> > 
> > https://www.theregister.co.uk/2019/07/09/samba_sans_one_smb1/
> > 
-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



