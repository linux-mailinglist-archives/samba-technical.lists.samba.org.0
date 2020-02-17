Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B0084161884
	for <lists+samba-technical@lfdr.de>; Mon, 17 Feb 2020 18:08:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=PWJkLUj2T2iVNQu1l1vUASByHNN9ZpUIz5+dLkbjxWQ=; b=IwVPQgUUUdgkAfmLmOv0nQpm/d
	AtyZAwqzvWqS0eymA5eZljunYmwfL8ghlPV8O+olHMs8UonXhI7592SNs/M1p0Hok6glu+/Hrysip
	Ob5WiAzqsTz+v2KXxBoLpfZKZ+P2tgQxE86xCtMxGrM2YfDi1m5QwR2P8vJQNokofrIwkoR4BfDcl
	K+3m4KWbWXOw4mogHeHWof1GQm0UZmaVx3rlJvD9XHMvl+4QBIAHN/PurkJeVJ/alkfB6Qm+VUT2o
	DFDH7UqRByJ4nl2kxXL335WKoc2KOfS8g/qe3JuRf2OFPXItGPE4Y5gpQJhu4nD95ntwz3OIPoaL1
	l85yd4cw==;
Received: from localhost ([::1]:65224 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j3jsa-00AH71-2T; Mon, 17 Feb 2020 17:08:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37248) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j3jsV-00AH6u-6E
 for samba-technical@lists.samba.org; Mon, 17 Feb 2020 17:08:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=PWJkLUj2T2iVNQu1l1vUASByHNN9ZpUIz5+dLkbjxWQ=; b=qjluDnhvOYyaQgFhtNLGNgvNLe
 ClfBfYOPSMaDe4duUUliJupcYOa/tsJZMzMwJ0lRmuvpm4N3WFBkJi0e2yyrxlS7Ak/jX2u5AglV8
 vpgZjHwSdUkI8cn58g7yEObdg68gnh44eE12V3p9jaLa/lhHZ7YT6iU7evB+nwzqK+PvAW1RG8nkF
 t3H2M+f+4XREqotJcbnuJmRzhHOATV7P2H0z6OnKRITt8oy7xjgWx0mDveKYIfDES79lemp+wCXZP
 3UdgQka3IaMvxAfuZO4yrTV9k9mFk2BFGIxfeFBtpGlrXrv9SmAPawZ6OpTZ26v8QZlhTxt0DImeG
 baHRKPMKjWjXPBtRkMmBsEe4fV5q3NcvTYrP9/C3cWnIVVlfDSfzN6Q6McV3/6IXxvaFOVRUyioUz
 +Y0c6KW97qi+e+s2dqwDN6B+j9t+n4W/D3PpkCncNS1RiEjOd/Ig+fstSOiCxwGk5gu7+VumuDIaF
 o2HrO601PQKh9oQLIjl/TCID;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j3jsT-0007RL-SW; Mon, 17 Feb 2020 17:08:14 +0000
Message-ID: <0bfee16342064a00ce1b69edc9a1560f4f23e16e.camel@samba.org>
Subject: Re: QNX6.6 cross-compilation problem
To: Nicolas Pinault <nicolasp@aaton.com>, "samba-technical@lists.samba.org"
 <samba-technical@lists.samba.org>
Date: Tue, 18 Feb 2020 06:08:10 +1300
In-Reply-To: <0102017053b6e994-c1f3f196-af94-47c2-914e-427291dbc480-000000@eu-west-1.amazonses.com>
References: <7e220de2-1a52-02a8-ba8e-2fc963fa7699@aaton.com>
 <116a320e-62d5-b51e-0b0d-7c0709237d0c@samba.org>
 <51f6d175-d856-0d59-a19b-ee326066fae5@aaton.com>
 <0102017053b6e994-c1f3f196-af94-47c2-914e-427291dbc480-000000@eu-west-1.amazonses.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
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

On Mon, 2020-02-17 at 15:14 +0000, Nicolas Pinault via samba-technical
wrote:
> Hi Uri,
> 
> I'm using Ubuntu 18.04.4 LTS (32-bit).
> I use vanilla Samba sources (4.11.6) downloaded directly from Samba WEB 
> site. No patch applied.
> 

> 
> Looks like asn1_compile is a target executable, not a host executable.
> Do I have to run waf with special options when cross-compiling ?

This is a known issue:

There is a workaround patch here, but do read my followup there for why
it isn't my preference and so why this isn't merged yet.
https://lists.samba.org/archive/samba-technical/2019-October/134438.html

The patch is here:
https://attachments.samba.org/attachment.cgi?id=15558

I hope this helps,

Andrew Bartlett

-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



