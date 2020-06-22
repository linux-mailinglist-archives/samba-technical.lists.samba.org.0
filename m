Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5232620347F
	for <lists+samba-technical@lfdr.de>; Mon, 22 Jun 2020 12:06:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=6VzNlNy5TLDCO3Aq+J6UiD4Wzrp8S7FKbfR/HDUKu4U=; b=Y1eqVN0sdFJNit4fnSvbiY64Y3
	KnonmZkuDsPgHzq1DY1a8xAmq6d9EUguDxi8Tt6f1JnJGD056TJCCg6ynSVxACvoiXgqRYBD6W2DO
	KT7ulH9JaDhvA368zHdn0DLnfZf9wNKxqj6OlSWNiG9zf4NnDBCRT8BVkErm9+ch8gaoIzS098Zhz
	jj2fQekxySTEWn001lb+IHvDbxhJLhck715QhOJNnYSNQ3LLrLS0Ycc9818bezQOm1nvzZsP+yuWu
	B5mbFV0QP4UMbplQT8LSZPLTb+1/UH2kIozBwMKYqD+MuB6tBzmwGOApn4GGILkMPnQs2UHElYClr
	i1OqVZoA==;
Received: from localhost ([::1]:22098 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jnJL8-001keB-Re; Mon, 22 Jun 2020 10:06:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58550) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jnJL2-001ke4-PM
 for samba-technical@lists.samba.org; Mon, 22 Jun 2020 10:06:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=6VzNlNy5TLDCO3Aq+J6UiD4Wzrp8S7FKbfR/HDUKu4U=; b=xwMAXxLP2UCUMtJQZA/38TqPoR
 nXtlWEcdSATDLxH7YLzvCR3QLrXcpKjiIZvphaR738HxvMFal9nU+8UZjGfrJAQ5Arz+BtXDIXjT6
 +0Rmc/3hq5GWqYKHkNf0lPppyLdrf1aIpwffCcap1dfedSaCVMr7JDaJGCvx52+iubqlG0LaSJTDo
 QboUJSlULCil/RiONR1TgA4yzAF5H+GTCHY0yWuNT/LZJBeJuETVGtXq+eY1/wsQty0tdYcEC22bS
 ZJ/ChpqYSgts2U0S1/R8CVAZ1TurfFGTf3fF1oUj8SaeXZbuKacREvw1esX7iazZTDoiUd9WCS02h
 NSQ23asag1qziyNqKlUAezC/LY0j2nmyvUbiQKqody3OqXLmrIErTX9i4AqwgUPY4uixlZyAmCV+r
 XkIO/f9yIw7IN7vFhCbtd2MubAdWftRZlc5Jt0qKBnXiQCZrC+YlZQIco1/x11ViZwsOj9VQF+MZJ
 Qbwt6qlviZeASozmvylpX7mZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jnJL1-0007Um-Pr; Mon, 22 Jun 2020 10:06:03 +0000
Date: Mon, 22 Jun 2020 13:06:01 +0300
To: hezekiah maina <hezekiahmaina3@gmail.com>
Subject: Re: GSoC: Week 3 Progress Update
Message-ID: <20200622100601.GK3036357@onega.vda.li>
References: <CAH72RCU=2HPWJHjgtMFx7wM061n-Jjo7aYRinxLPDtq8fo-OrA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH72RCU=2HPWJHjgtMFx7wM061n-Jjo7aYRinxLPDtq8fo-OrA@mail.gmail.com>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: samba-technical@lists.samba.org, "abartlet@samba.org" <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On su, 21 kesä 2020, hezekiah maina wrote:
> During the week I worked on the following:
> 
>    -  User Management
>    - Organization Units Management
>    - Added the patches Alexander recommended
>    - Changed the UI of components written in Week 1 & 2
> 
> Next week I will be on working on the following:
> 
>    - DNS Management
>    - Forest Management
>    - Group Management
> 
> Last Week's changes are in the develop branch of this repo:
> https://gitlab.com/HezekiahM/samba-ad-dc

Thank you, Hezekiah!

I made a short gallery of screenshots here:
https://www.samba.org/~ab/samba-ad-dc-cockpit/

The code now builds and works mostly fine on Fedora 32 without any
additional changes. I had to disable SELinux on the system but this can
be looked at later.

-- 
/ Alexander Bokovoy

