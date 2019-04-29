Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA045EC76
	for <lists+samba-technical@lfdr.de>; Tue, 30 Apr 2019 00:08:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=nqpcq3yQkYzIXC1gLWAO8/s8FEpMxSGTcopD6CG2Hfw=; b=TiFqsejNd+nEbfNKP2WlvOUpbV
	FQRwftpMRccx5Bn8E4OkQh7CkRWyMhgNcTi+2B0ZIoswRMezVx/YrrC0MY+Iv9YD6Y+M4ZQoKEgae
	uy7W+ckgXg/1DtclJdLw141iPQgAtY++PYDZdPQJ+FgkZKRH+TjhsEVDfaoN+mKxXpYUELIadtYWe
	wCVin0AHMwMlj3JO5No1CYIfNEu+Pyt5EUyBUMytkIA3Jgb5p1zRrD1vJIFtWPupxQuE8kmNd3hkv
	+2QyQKDS8nrS20XcczIChyyIy7NXJPMEXa7B3lWidjPGmtHyuorWzRS2BvVQbZhy5WGOgxCSUwTFA
	+sWSzv7A==;
Received: from localhost ([::1]:60310 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hLERs-003lQR-4m; Mon, 29 Apr 2019 22:08:32 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:53550) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLERn-003lQK-JT
 for samba-technical@lists.samba.org; Mon, 29 Apr 2019 22:08:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=nqpcq3yQkYzIXC1gLWAO8/s8FEpMxSGTcopD6CG2Hfw=; b=CIlm24UeZk6bbJEFVjOJUPEz1N
 TR+MrlZ/5S4nrG01RXu6zV9SE9wf1HpkvgKqYJsKT8qEAIY1EQ1rmdK3sCw+lbystxHphecVg5obF
 8lJk+S1q3L1DJ+lOHYbeK7ULAncEgZLeQ/EKyN8NtUTdcT2P81LbtCqUaX1kI7Bm3IIs=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hLERm-0001M0-F4; Mon, 29 Apr 2019 22:08:27 +0000
Message-ID: <1556575702.25595.75.camel@samba.org>
Subject: Re: [PATCH] Revert "wafsamba: Enable warnings for missing field
 initializer"
To: Christof Schmitt <cs@samba.org>, samba-technical@lists.samba.org
Date: Tue, 30 Apr 2019 10:08:22 +1200
In-Reply-To: <20190429193555.GA28948@samba.org>
References: <20190429193555.GA28948@samba.org>
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAIAAADYYG7QAAAAA3NCSVQICAjb4U/gAAACRklEQVRYw81YS67DIAwkVe8FPRm5menJeAu3lmUCbyBGKqsmRXjwb8Y5aq3hl9Yj/Nh6Tu0upZRS+EdKiV+e5+mJqMKLiHLORBRjzDmbc/hlvb1QD2k3sG84+dhhvF6vlzymlNY8dyBJzUdLjAwyvaeU8n6/2WHpu/xDRkREJI8cOBMgfuRQxhj58JzzbBwhQDFGA07M6/efE0MQxDHGFvpdQHy6MUxqtU4yezRcH0B4GfbM44BWGqOurF6Omz140a0ASimJvdbwZT32XrpRh5yuwY1d0vPrdNkv91+T8uBRG8l1uiX+JtsHxPNIWE27ugwTctTdHCIiYXvuy4P7IDl0CxAzl2xgZTJwgw+g3kGaHwYh5g2sljyrjIVEq4pYBg2Kq3yXZ5WxjfO7zF9jRdXrnLcEmlbTRnNpcT0gvpTScUC2HlOE2ipAvPuJanMT+Xc0PC4dFzu1DEO4HgczaS5kOnZ4vM7zxNU+mtRyRVPDgqyX3cdx8AQCCrQnfkV9VzMA9Ryg3ek8Sgsg3QX+nbz03Og5l10ytp6HusQUwpjd1rnsksbHlhjuVGdBAbWzIiJu5MvEFkA6OkiwBO4uQL3ADeQ9b57t74+FBo1s47IqpVxqBDcuQ66r94QQJOH2ctnAf9oZtdbZYejpi2bQEveO0sb2JXu09OJJrnpil4SV5G2N6Y+1QjL+gHSKDApHJoJWF3hW2fInh6lutGW216OPRBZtRZscwyQvI+KuTj3rp4VP1VsAcTobxgDngukqm3LPgmL8A4m377Y5OvTKAAAAAElFTkSuQmCC
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2019-04-29 at 12:36 -0700, Christof Schmitt via samba-technical 
wrote:
> Revert the patch adding the warnings since that causes problems when
> compiling master on RHEL7. Many C99 initializers of nested structs are
> flagged as problematic, so it seems easier to remove the additional
> compiler checks.

Shouldn't older OS versions just not be compiled with --picky-
developer?

I don't mind if a test is added to wscript to detect and fail --picky-
developer on such hosts, but RHEL7 is actually just as old as Ubuntu
14.04 which we just retired. 

Hopefully RHEL8 is just around the corner.

Andrew Bartlett

-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT   
https://catalyst.net.nz/services/samba





