Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DA310A358
	for <lists+samba-technical@lfdr.de>; Tue, 26 Nov 2019 18:29:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=ehMa8NKWQCVrEYZ6nCxzCwSOLh+U86GbkxXPvOIXXpE=; b=rRN7uncxDuQTxDUFJvvqBso8mF
	zc9tmHM0JYobIokOX8UBwVDQMl+qZBihA+ocVDunwVXF4Jt4E7+v5WWq9Gz9EEqY2bB+5fnVB686J
	iPV+oUau/8QGt/ErgbgyP4ky9SlLVQGXYpcMdkV40QwWs2KeCVUsUzm3vpq9GO+Jhr6cRG5AVipje
	LVSxHnOGT8p0MGPkI04YdBnWU19MCUvftqK6rO6hXhsLosDLzTmqqhmLJVQC4/PR5oYwR3eek5TNv
	TWtwJUT7FrwvnYmCprkmJq63lB44/kig5FBc0aaBYE2iDsA1Tkqsu4+uMEuBZcyjCuab5QfJC5Yv3
	xWyYA/Hg==;
Received: from localhost ([::1]:19380 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iZeeA-002UUD-Im; Tue, 26 Nov 2019 17:29:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29000) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iZee5-002UU6-TF
 for samba-technical@lists.samba.org; Tue, 26 Nov 2019 17:29:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=ehMa8NKWQCVrEYZ6nCxzCwSOLh+U86GbkxXPvOIXXpE=; b=u2tVOmTJmDPwjzjs2FYcbeGmpU
 L7PUc1tFY//P9E8RjohGimh1O0La23rNB0sEXa2WZdjcqff1YEu4HjjoRjtC7kThINDm/sxFPYQzH
 cf2eeeO+Koo/XLFl7ihkFAvoHzrimJ8HibosLglBFj4Q7O6MckakTIKNwpmrTuW4BQXySmFkjfn2c
 akzdh9s+a0iTPo8HXY/Mw/AfVLi/1zY9+5FjWXxNgvmatZBc75jlf8/rQGTTDW7axrg6E4m9MsY32
 GLumyVPlG+asaJrNKnuij4gUmADgztWUq+ATHp+b7PWMFu5o0t2B5PMh8NgbmK4TX3KmE/D4MDZlO
 1LqFDbnb/LAyljbRF/HHOhSg/fEQIkx+TE93ypNsibDpWVBHaPaFwwEOG5Fk1zzbEKjPOs6WqGRMu
 a7ROdaCKIpYZa7nXD7VuCPKSh1odJ1cq+S9HHGpSxIZucBukrxD1wKXyeWu+/0nXlTqC4Dx6mSiuy
 CPdk6e+WDgKQw0Prq/W0DmYN;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iZee4-00004w-3Z; Tue, 26 Nov 2019 17:29:00 +0000
Message-ID: <5150a81373a8328e303cc97aaf67f1670181c699.camel@samba.org>
Subject: Re: Converting SMB1 tests to SMB2
To: Noel Power <NoPower@suse.com>, Ralph Boehme <slow@samba.org>, npower
 <npower@samba.org>
Date: Wed, 27 Nov 2019 06:28:54 +1300
In-Reply-To: <7a86b0cd-9eea-d077-69ac-9077d0cc12c8@suse.com>
References: <f0f71737-cd07-b361-1c26-58116e6e8ed8@suse.com>
 <be6770e5-5bf0-4665-4a88-3e4182e4c82e@samba.org>
 <0981db46-93bf-f153-c98f-15d5cf404353@suse.com>
 <ed7eb92f-46a7-758e-f3b5-185d71b8b98a@samba.org>
 <002434db-63ef-edad-d091-76e3efe783d1@samba.org>
 <15dfbaf6-c774-debe-b61e-c3ef4e7f9727@samba.org>
 <d9625941-c85a-a686-2162-30c80a2e84b3@samba.org>
 <fa464ebe-cfe7-1d6e-7435-c896e2cc188e@samba.org>
 <f479113c-7a74-8259-823e-4ae1c4a713c6@samba.org>
 <47fef5d6-7fb6-b054-a8c5-7a28b63e97c8@samba.org>
 <9cc9d402-57fb-3568-29e6-12284d6ccd98@samba.org>
 <f5970612-2998-cef1-dcca-40188c7a176f@suse.de>
 <361f5a38-66fb-e18c-7858-c5db6e93424e@samba.org>
 <dc95f81c-90ba-a368-9b3e-ccdcf067edaa@suse.com>
 <c25ed441eedb2a864429c0154859f2afe95f38cb.camel@samba.org>
 <f3fcbb1f-a25c-f7cb-4023-fdef68e208a8@suse.com>
 <a146e395-f9ca-12d0-2cab-ca52e8209706@suse.com>
 <f7229830-b844-a509-ed31-9707e0101666@suse.com>
 <e09044be-713a-f074-ed2f-e41168646d81@samba.org>
 <7a86b0cd-9eea-d077-69ac-9077d0cc12c8@suse.com>
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
Cc: Stefan Metzmacher <metze@samba.org>, David Mulder <david.mulder@suse.com>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2019-11-26 at 16:09 +0000, Noel Power via samba-technical
wrote:
> yes that is true, however I am not sure even if these days make test
> normally will work (or if anyone actually even use it instead of
> autobuild)

Douglas recently ran one in aid of some of the much-alluded to fuzzing
work we have been doing, and it still works. 

A couple of failures but nothing catastrophic.  We need to keep 'make
test' working.

I need to look over this more carefully, I've been swamped in my own
world, but I will say this.  We can't just keep creating infinite new
environments.  Instead, we should focus on sorting tests from their
current place of running into the 'right' place.

Tests that are carefully examined to just need a simple fileserver, and
which are not impacted by the use of full ACLs should run in
fileserver, not nt4_dc AND ad_dc for example.  

Getting to that basis will then make it much easier to have an SMB1 and
SMB2 simple fileserver. 

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




