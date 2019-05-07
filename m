Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id B49DA15892
	for <lists+samba-technical@lfdr.de>; Tue,  7 May 2019 06:35:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=ValoZB7eekBi6lQ+wKbIrV1CcsbdNaYwptoglrXIE3c=; b=4Z0pKr4jokq2jfVeiDGUBWN9zG
	i5oF6jAdolcii1HXfcyj9cACbH/9+/wa1j17VKbG/sW3JyHCX0Y6hN80RCIAfBUdl5IkHqWSoC7OI
	159roU45Ccb8k8LEGRTqbczNruBgv52fu5tkmMQd0QqiIbmCCAoS3FMM7LCZlzAS33cCS8MN6qtV+
	l0nXJ9Z5lTJj9iTQK97ODInmecKkSQGlRvRa6qdwFUqP4pd0frou30thBm+BbfDXok7VCX6exkz/q
	liTA29lgfxsTVfVn4EWFdEZiSAdYb4Xqh8rf+akQ6yyQJOXASSN2BgQ4TnJnviJFAmZIijHwKtZQW
	WNqJhfxg==;
Received: from localhost ([::1]:38498 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hNrny-002oBg-65; Tue, 07 May 2019 04:34:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:47898) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hNrno-002oBF-GO; Tue, 07 May 2019 04:34:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=ValoZB7eekBi6lQ+wKbIrV1CcsbdNaYwptoglrXIE3c=; b=edVOIloNpXKhXBH+5AahY6GqO3
 f9MUdnkb5lWBK1e/7nYcHt+owsJUoXc97dq3yp33YSGrKi4vBxMAWeyv+NwOcbSgQbAOosXbDBvgU
 imFfiu6h7SvIA0M6yX+xy7054hKhtTpZc42KTjigoh5UU57ZU6/s83DFMXNTZrMZSaLs=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hNrnj-0002NE-Qb; Tue, 07 May 2019 04:34:00 +0000
Message-ID: <1557203635.14583.19.camel@samba.org>
Subject: Heads-up: Security Releases ahead!
To: samba-announce@lists.samba.org
Date: Tue, 07 May 2019 16:33:55 +1200
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
Cc: samba@lists.samba.org,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

This is a heads-up that there will be Samba security updates on
Tuesday, May 14 2019. Please make sure that your Samba
servers will be updated soon after the release!

Impacted components:
 - AD DC (CVSS 7.5, High)

Andrew Bartlett

-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT   
https://catalyst.net.nz/services/samba





