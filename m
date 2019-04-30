Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id C017FEF9D
	for <lists+samba-technical@lfdr.de>; Tue, 30 Apr 2019 06:30:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=VOZbf+bZo76/KmCCU83bn/FLWRKkdhThvVz87kWS7yc=; b=VaKTBHNMW8IUU77nF4mU+dKY5u
	SXEAWC4de5v3w2FEdWFlieWwD01+PPvY/FD8HXc0ibZKSZIgaNG06dgwqN48u2YSyNaQMbUABhqgG
	F36X091YHqADlJKdOXYUu79Mzs68LBvY0GaOnpWZ68WduntrhIt0G9XiPHVGX8NEy9oO5Upk6NPfX
	YGatX9aALIG3MRvMheFvuGHAbCHdrqMKFppfw2OdVJcu1phBPMNS9GK+IIXD28oQD2XH0MPMi4mhv
	jzMIcnAdZoYWfWCCbw/MCaYy3tkWJ9gk9glFhoiGQpQ/xFpQpzu3+FEm2ci3jm9yjwoOUempjgtKP
	dJaatI7w==;
Received: from localhost ([::1]:23408 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hLKPN-003n0C-OG; Tue, 30 Apr 2019 04:30:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:38652) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLKPJ-003n05-OE
 for samba-technical@lists.samba.org; Tue, 30 Apr 2019 04:30:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=VOZbf+bZo76/KmCCU83bn/FLWRKkdhThvVz87kWS7yc=; b=Tc7t+pFnSjPL8JGMH28npgFbRY
 6/5XGih3wkibQsOPOQt4jELHAo32A9o/RBuNP3je4dVi+hlCXOfQAjq5Mhct4xK6OIr715j4JUalZ
 /ze4hEq4eHFpmIYwafvS7NTtz8stnXtJ6BpaumJ9BSj5PdvRra3kWdWvYLL0RGAjbiC4=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hLKPD-0005Rz-4U; Tue, 30 Apr 2019 04:30:12 +0000
Message-ID: <1556598606.25595.91.camel@samba.org>
Subject: getting centos7 into bootstrap and gitlab CI
To: Ralph =?ISO-8859-1?Q?B=F6hme?= <slow@samba.org>, Christof Schmitt
 <cs@samba.org>
Date: Tue, 30 Apr 2019 16:30:06 +1200
In-Reply-To: <606612F7-D9E4-4043-BBDE-4A2C1CE0ABBB@samba.org>
References: <20190429193555.GA28948@samba.org>
 <634FD7C2-DD12-4714-9AE8-A95BD3EF40E9@samba.org>
 <20190429200808.GA26142@samba.org> <20190429223210.GA23900@samba.org>
 <1556578686.25595.77.camel@samba.org> <20190429232148.GA875@samba.org>
 <606612F7-D9E4-4043-BBDE-4A2C1CE0ABBB@samba.org>
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAIAAADYYG7QAAAAA3NCSVQICAjb4U/gAAACRklEQVRYw81YS67DIAwkVe8FPRm5menJeAu3lmUCbyBGKqsmRXjwb8Y5aq3hl9Yj/Nh6Tu0upZRS+EdKiV+e5+mJqMKLiHLORBRjzDmbc/hlvb1QD2k3sG84+dhhvF6vlzymlNY8dyBJzUdLjAwyvaeU8n6/2WHpu/xDRkREJI8cOBMgfuRQxhj58JzzbBwhQDFGA07M6/efE0MQxDHGFvpdQHy6MUxqtU4yezRcH0B4GfbM44BWGqOurF6Omz140a0ASimJvdbwZT32XrpRh5yuwY1d0vPrdNkv91+T8uBRG8l1uiX+JtsHxPNIWE27ugwTctTdHCIiYXvuy4P7IDl0CxAzl2xgZTJwgw+g3kGaHwYh5g2sljyrjIVEq4pYBg2Kq3yXZ5WxjfO7zF9jRdXrnLcEmlbTRnNpcT0gvpTScUC2HlOE2ipAvPuJanMT+Xc0PC4dFzu1DEO4HgczaS5kOnZ4vM7zxNU+mtRyRVPDgqyX3cdx8AQCCrQnfkV9VzMA9Ryg3ek8Sgsg3QX+nbz03Og5l10ytp6HusQUwpjd1rnsksbHlhjuVGdBAbWzIiJu5MvEFkA6OkiwBO4uQL3ADeQ9b57t74+FBo1s47IqpVxqBDcuQ66r94QQJOH2ctnAf9oZtdbZYejpi2bQEveO0sb2JXu09OJJrnpil4SV5G2N6Y+1QjL+gHSKDApHJoJWF3hW2fInh6lutGW216OPRBZtRZscwyQvI+KuTj3rp4VP1VsAcTobxgDngukqm3LPgmL8A4m377Y5OvTKAAAAAElFTkSuQmCC
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
Cc: Andreas Schneider <asn@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2019-04-30 at 06:21 +0200, Ralph Böhme wrote:
> 
> > > Also, could you please look into adding CentOS 7 as a supported
> > > platform via our bootstrap system so we don't regress here in the
> > > future?  There is partial support already, but it wasn't finished
> > > (mostly to avoid chasing two rabbits at once). 
> > 
> > That is a new area to me. I see that CentOS is listed under
> > bootstrap/generated-dists/centos7/. Would the only missing piece be the
> > centos7 entries in .gitlab-ci.yml, or am i missing something? I can give
> > that a try tomorrow.
> 
> that would be much appreciated and I can help with that, but it's
> certainly not a requirement to get your patch for the missing-field-
> initializers in. I'll review later on.

Thanks Ralph for offering to help.  It has been really cool to see so
many folks stepping in to maintain and extend our package list.  It is
lovely to have this task, but even more so the knowlege of how to do it
practically, distributed around the team!

I totally agree this is not a pre-requisite, thanks for making that
clear!

Andrew Bartlett

-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT   
https://catalyst.net.nz/services/samba





