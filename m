Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DB455B13
	for <lists+samba-technical@lfdr.de>; Wed, 26 Jun 2019 00:28:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=qsHjGWqi0AWBLOY3EOyFnATpELqSWWg/HO9Ab8ChvDw=; b=qLpuKMB1yOAFf1cky3zrtVMl5i
	DdKMDmz8N//tdz2xRCM6iYgNl+wFqaDxFBDe0xADFkxngaR+QgvdGSiJO86E1J5py2vX+LPzP22sM
	BanPJBLn+9zFbAutndDt18YWaUJxFWiAjRxiqc23U2gC94rbGrOsIVE4GkDR0T8uhA3SRIKYvBiNo
	OMjizy9mUDdQN6hbidCaJEStGTjJSA5LO0NYDjMxfbJFZ+I1KM5DXHkVZGXCSBWQixdXZVP4PDCMx
	w28jOQM8Sq/Zt06TPmbxlvJPhnUjkRfC9YekwfBN9NsODcC98w8pCmiH19kqpGNd4SU1lGs2NfrmB
	w3uat8MA==;
Received: from localhost ([::1]:62758 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hftum-001jkT-6N; Tue, 25 Jun 2019 22:27:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49826) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hftug-001jkM-NC
 for samba-technical@lists.samba.org; Tue, 25 Jun 2019 22:27:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=qsHjGWqi0AWBLOY3EOyFnATpELqSWWg/HO9Ab8ChvDw=; b=TgQwbvrTDx21eDDDLMZQVqECmg
 /Jn5RCdRjowOPvvH1D881IspPMIcszlSKXN8C3lUQs0qyXSgO1RSRmo77uh8vCUFcsj1lMEoWXv/4
 0ZGplTBz4c3tRcIla6eEZJgFtj9jn8Ygg1p44ZNDGxGcy04vAEh+N1VCp4T5YLJqBPxw=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hftuf-0007yJ-5q; Tue, 25 Jun 2019 22:27:41 +0000
Message-ID: <1561501657.28284.65.camel@samba.org>
Subject: Re: Document GitLab as the only way to contribute to Samba?
To: Uri Simchoni <uri@samba.org>
Date: Wed, 26 Jun 2019 10:27:37 +1200
In-Reply-To: <1335d0cf-bb13-6fcc-a4ea-75e6d4345cf5@samba.org>
References: <1561079117.28284.21.camel@samba.org>
 <1335d0cf-bb13-6fcc-a4ea-75e6d4345cf5@samba.org>
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAIAAADYYG7QAAAAA3NCSVQICAjb4U/gAAACRklEQVRYw81YS67DIAwkVe8FPRm5menJeAu3lmUCbyBGKqsmRXjwb8Y5aq3hl9Yj/Nh6Tu0upZRS+EdKiV+e5+mJqMKLiHLORBRjzDmbc/hlvb1QD2k3sG84+dhhvF6vlzymlNY8dyBJzUdLjAwyvaeU8n6/2WHpu/xDRkREJI8cOBMgfuRQxhj58JzzbBwhQDFGA07M6/efE0MQxDHGFvpdQHy6MUxqtU4yezRcH0B4GfbM44BWGqOurF6Omz140a0ASimJvdbwZT32XrpRh5yuwY1d0vPrdNkv91+T8uBRG8l1uiX+JtsHxPNIWE27ugwTctTdHCIiYXvuy4P7IDl0CxAzl2xgZTJwgw+g3kGaHwYh5g2sljyrjIVEq4pYBg2Kq3yXZ5WxjfO7zF9jRdXrnLcEmlbTRnNpcT0gvpTScUC2HlOE2ipAvPuJanMT+Xc0PC4dFzu1DEO4HgczaS5kOnZ4vM7zxNU+mtRyRVPDgqyX3cdx8AQCCrQnfkV9VzMA9Ryg3ek8Sgsg3QX+nbz03Og5l10ytp6HusQUwpjd1rnsksbHlhjuVGdBAbWzIiJu5MvEFkA6OkiwBO4uQL3ADeQ9b57t74+FBo1s47IqpVxqBDcuQ66r94QQJOH2ctnAf9oZtdbZYejpi2bQEveO0sb2JXu09OJJrnpil4SV5G2N6Y+1QjL+gHSKDApHJoJWF3hW2fInh6lutGW216OPRBZtRZscwyQvI+KuTj3rp4VP1VsAcTobxgDngukqm3LPgmL8A4m377Y5OvTKAAAAAElFTkSuQmCC
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, 2019-06-22 at 07:30 +0300, Uri Simchoni wrote:
> 
> Speaking for myself, this thread brought to my attention that Samba
> development is no longer happening on samba-technical mailing list. I'm
> all for gitlab, but had the notion that you post an MR *and* write to
> samba-technical, which was certainly true 6 months ago. By moving to
> Gitlab without proper notification you've lost me as a reviewer (and I
> do make occasional reviews in places where I was involved). I'll take
> the proper measures to get back on-board :)

> So a clear statement *is* in order.

Thanks.  I'm sorry you missed this, the extent to which the team had
made the successful migration surprised me as well!  

Indeed it took one of my colleagues (Tim) reminding me at the office
that Samba has silently moved to GitLab before I realised how complete
it was!  (Noting Martin as the exception, per the other arm of this
thread). 

I'm not sure that had I tried to announce or compel this any earlier I
don't think it would have been nearly as successful: the gravity of the
team's activity is far more powerful than any announcement or policy.

However this left you in a tricky spot and I'm sorry for that.

To others: If you are an active samba developer and I've missed you
please ensure you have a GitLab account!  (I did the personal setup
phase a year ago for those at SambaXP.)

Stepping back, before your time we moved to 'autobuild', which started
out voluntary and was even more quickly adopted, but buy the same
means:  Almost everyone was using it, and then we made it policy. 
(Actually after someone pushed directly a 'trivial fix' that 'didn't
need testing' and broke the tree).

I'm not sure if you were around for the start of the code review, but
that was the opposite a proposal was put and pushed hard to a vote,
causing great trouble right before Samba 4.0.  I've worked hard to
avoid that kind of thing. 

I hope this background helps and I'm sorry you felt left out,

Andrew Bartlett

-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT   
https://catalyst.net.nz/services/samba





