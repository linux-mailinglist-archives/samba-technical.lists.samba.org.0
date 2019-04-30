Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCEBEF62
	for <lists+samba-technical@lfdr.de>; Tue, 30 Apr 2019 06:22:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Date:Subject;
	bh=9tl6SmMDwqzNGaN9XJ3AJMUjZqwvFLrecScRxKkEjI0=; b=aG18tOSi1dEw/RoHbTo/dxySSb
	x/j45AXTh96BhIftfQ0IVkv/940OjU2Y9d3Mposbg2FNYcABRYOr3TeTOOKNVW2EmGM0ZXfjDKJyt
	hzWgVdmWPlygQR099s9ZtW9RiLTOxfC++muwQAtap+VN+gUprtRt1KdWAQyyF3+02+7LxmCJiilwD
	oSK9NM9QCVsFn2c4mxfzk3q1DmaM6ChuwIzuMLLdI6Km1GCuehK2k53nebnBZARJdNrViHE+dEjMN
	T/0YmyXfQnfNmOe7Q/colRnKNKuTZhwFFmYqv2NP3E90lnGleJhq2V42WqX8BXy9gLw3Ly0ioCtV9
	szCgxeWg==;
Received: from localhost ([::1]:22668 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hLKGx-003mts-Vu; Tue, 30 Apr 2019 04:21:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:36974) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLKGt-003mtk-R5
 for samba-technical@lists.samba.org; Tue, 30 Apr 2019 04:21:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=To:Message-Id:Cc:Date:From;
 bh=9tl6SmMDwqzNGaN9XJ3AJMUjZqwvFLrecScRxKkEjI0=; b=Uoo1PxhCLzpEcgz/R3D93lqGUH
 xLa9RBHanqyOOAoLslXr3j0iNiWCcan1mrRvwvrhpRpW8i/mhexDIX3i5V3Nzvxv0safogjCL1XxA
 r+PcElRB2UAvqxjftzQPXcdE2wyWizEBf+hTP9RoJcbCgUf02zU+JAKPgcPasq+SRZ8s=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLKGs-0005LI-Ab; Tue, 30 Apr 2019 04:21:34 +0000
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Subject: Re: [PATCH] Revert "wafsamba: Enable warnings for missing field
 initializer"
In-Reply-To: <20190429232148.GA875@samba.org>
Date: Tue, 30 Apr 2019 06:21:32 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <606612F7-D9E4-4043-BBDE-4A2C1CE0ABBB@samba.org>
References: <20190429193555.GA28948@samba.org>
 <634FD7C2-DD12-4714-9AE8-A95BD3EF40E9@samba.org>
 <20190429200808.GA26142@samba.org> <20190429223210.GA23900@samba.org>
 <1556578686.25595.77.camel@samba.org> <20190429232148.GA875@samba.org>
To: Christof Schmitt <cs@samba.org>
X-Mailer: Apple Mail (2.3445.102.3)
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
From: =?utf-8?Q?Ralph_B=C3=B6hme?= via samba-technical
 <samba-technical@lists.samba.org>
Reply-To: =?utf-8?Q?Ralph_B=C3=B6hme?= <slow@samba.org>
Cc: Andreas Schneider <asn@samba.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


Am 30.04.2019 um 01:21 schrieb Christof Schmitt <cs@samba.org>:
> Yes. CI is running now at
> https://gitlab.com/samba-team/devel/samba/pipelines/59040252

Thanks!

>> Also, could you please look into adding CentOS 7 as a supported
>> platform via our bootstrap system so we don't regress here in the
>> future?  There is partial support already, but it wasn't finished
>> (mostly to avoid chasing two rabbits at once).=20
>=20
> That is a new area to me. I see that CentOS is listed under
> bootstrap/generated-dists/centos7/. Would the only missing piece be =
the
> centos7 entries in .gitlab-ci.yml, or am i missing something? I can =
give
> that a try tomorrow.

that would be much appreciated and I can help with that, but it's =
certainly not a requirement to get your patch for the =
missing-field-initializers in. I'll review later on.

-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


