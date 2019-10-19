Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C538CDDA84
	for <lists+samba-technical@lfdr.de>; Sat, 19 Oct 2019 20:49:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=sh9pKInr8nDUTrfs9xovg58m7uDvljre4diXVMI8dMo=; b=RXByP9g2GSnvBYEqjvhK3dKifG
	ykYE4N0SuZFrZa28vjK0feQXla3kBNfb6JZEOuk6MuRdQ2p4Y/bX7N9BrXYUqA0VgBgsGtSqd/MMq
	TNmr15+NFeoePdM//seesGjyjkjlCOn34UwpxS3o+8rXmIRPlKF3BcLC30X2vxmNz5DecZfZhl7e0
	EknPEc6U3beLPYdmmxyWQ372sMuAoDFYPX4SsdSLHi717PdqW+e8X41ete5IS5PG92wY6DdHzdEHT
	ekPnxwLgD9FIceq+axmLyx/3eJO2StUFKHGihX2O0Rd+BDNAkadcSHmPetfKK27Tt+hxTA/RePdQ8
	7Uad7Msw==;
Received: from localhost ([::1]:39946 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iLtmW-000eqs-OY; Sat, 19 Oct 2019 18:48:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15058) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iLtmS-000eqh-O6
 for samba-technical@lists.samba.org; Sat, 19 Oct 2019 18:48:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=sh9pKInr8nDUTrfs9xovg58m7uDvljre4diXVMI8dMo=; b=ivgSgmogha3cYpOo4nDlHtFSve
 9TN5ojDe0B8fIqpdBzDNonTYVu6fHNvQL88EiBqSmmk2guTYPSEAu3zPFkQkd6x750G8pV0xCo2Ie
 rI3fBq3or4HTHdvYjbAuQkYAGJjA2HDxcWBzyih7GZPAGJN1q6hFu3SRRr9IZ+X3Kew6N7x27yEMP
 odxJZOMWc0ha9And8uwzphYy9zUpBuZ6PXwNYiduHeFmgIaodNzHYBTArUIwxTfQJQFYTrzrJ0idL
 RTl3y9ve3TiiYcQtrkR88qyxt+V07iPR8lNtAEahrfOsU4KKIIbh3JzeNGEZQOA5BAIigwOZ9cMb1
 o+ZwNdClOo1JfuPbE7rASh102FS75tP7C+QtgIraENoiLWVffO/T9I4tKsbp4J3pXV4zTtcYaCmg5
 9Xwy4ROLf+yxSl5nuXkFmRZtagtAvg0QyYYiN4KfkLoWD5t3DzDm8y8lXZZ5xBTOj0dK6cvdh2+I2
 SWMNoyMq1tsBo3CGf4lBST6T;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iLtmO-00015i-Da; Sat, 19 Oct 2019 18:48:45 +0000
Message-ID: <2d3b27fdc2a30b313e3ef63eb64cbaaec82838a7.camel@samba.org>
Subject: Installing PIDL for Samba 4.11 RPMs
To: Nico Kadel-Garcia <nkadel@gmail.com>, Karolin Seeger <kseeger@samba.org>
Date: Sun, 20 Oct 2019 07:48:38 +1300
In-Reply-To: <CAOCN9rw1g-N8iAV2z4S=-6Sx7GRQ_vACPcy-pOvwrLys_OykVg@mail.gmail.com>
References: <3ee51a4a-c102-df01-8e52-cf8ea702194f@samba.org>
 <CAOCN9rw1g-N8iAV2z4S=-6Sx7GRQ_vACPcy-pOvwrLys_OykVg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, 2019-10-19 at 12:22 -0400, Nico Kadel-Garcia via samba-
technical wrote:
> 
> What happened to the PIDL code with samba-4.11.1? I see that it's no
> longer in the source tarball, and had to edit it out of the RPM .spec
> file I'm using.

You can either use the build in pidl via pidl/Makefile.PL or just skip
it.  OpenChange is the only known consumer, and while folks sill build
it for the evolution-mapi connector it is sadly dead upstream.

Andrew Bartlett

-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



