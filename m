Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2D8142E8
	for <lists+samba-technical@lfdr.de>; Mon,  6 May 2019 00:48:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=ZzVvCEPbGJsgvbQRQwoNpQtTpLSX35VW/kFiRsc1eWY=; b=CXWoDjrO5oKpXCnHIYST6Lfl9I
	lR9W0lVB8AbJ+PwLt+1zyTyEKDFrKkHXdCAJapZos351wEreYrcbeYUr9sGcnEi0aHePjJaW3zaP2
	dl0yrM3PaweEnejD49Y/4/jRzHj2Atu4TByHFw0YqLHN/tuBiCvJJvDiZERmezdILJdb1fiyh1OEw
	W8GRCcga0L1rF/XDIs0u4id2D8Mqh+pFIUfj4dvZGcRGCmQXy+l5GGalZmCzc2UylT3LxVxLKCyLH
	+ctIMopY/z8xwTJPSjhrz+xV0D3J/ufGU51kRtiYeZBW2MejzpnFyaGJoe7VXh7RsFjNfYah6ec5T
	LzxTRoJw==;
Received: from localhost ([::1]:48602 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hNPvq-002Uie-5i; Sun, 05 May 2019 22:48:30 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz ([202.78.240.226]:60944) 
 by hr1.samba.org with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim) id 1hNPvk-002UiX-Cw
 for samba-technical@lists.samba.org; Sun, 05 May 2019 22:48:27 +0000
Received: from [IPv6:2404:130:0:1000:d0be:cba3:501b:8223] (unknown
 [IPv6:2404:130:0:1000:d0be:cba3:501b:8223])
 (Authenticated sender: joeg@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 771BE810CF; 
 Mon,  6 May 2019 10:48:04 +1200 (NZST)
Subject: Re: getting centos7 into bootstrap and gitlab CI
To: Christof Schmitt <cs@samba.org>, Andrew Bartlett <abartlet@samba.org>
References: <20190429193555.GA28948@samba.org>
 <2134250.fEHozF1qz7@magrathea.fritz.box>
 <20190430145845.6fcfb681@devstation.samdom.example.com>
 <3513637.hkN0grMHb1@magrathea.fritz.box>
 <1556649942.21278.15.camel@samba.org> <20190430230454.GA22132@samba.org>
 <1556674596.25595.100.camel@samba.org> <20190503233653.GA12691@samba.org>
Openpgp: preference=signencrypt
Message-ID: <30b5f26f-4458-2b4e-af04-e8b45ef9041f@catalyst.net.nz>
Date: Mon, 6 May 2019 10:48:03 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190503233653.GA12691@samba.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-AU
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
From: joeg--- via samba-technical <samba-technical@lists.samba.org>
Reply-To: "joeg@catalyst.net.nz" <joeg@catalyst.net.nz>
Cc: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


On 4/05/19 11:36 AM, Christof Schmitt via samba-technical wrote:
> On Wed, May 01, 2019 at 01:36:36PM +1200, Andrew Bartlett wrote:
>> On Tue, 2019-04-30 at 16:04 -0700, Christof Schmitt wrote:
>>> On Wed, May 01, 2019 at 06:45:42AM +1200, Andrew Bartlett via samba-t=
echnical wrote:
>>>> On Tue, 2019-04-30 at 16:10 +0200, Andreas Schneider via samba-
>>>> technical wrote:
>>>>> On Tuesday, April 30, 2019 3:58:45 PM CEST Rowland Penny wrote:
>>>>>> =C2=A0
>>>>>> Quite right EPEL doesn't have python34-crypto or python34-dns, but=

>>>>>> it
>>>>>> does have these:
>>>>>>
>>>>>> https://www.mirrorservice.org/sites/dl.fedoraproject.org/pub/epel/=
7
>>>>>> /x86_64/P
>>>>>> ackages/p/python36-crypto-2.6.1-16.el7.x86_64.rpm
>>>>>> https://www.mirrorservice.org/sites/dl.fedoraproject.org/pub/epel/=
7
>>>>>> /x86_64/
>>>>>> Packages/p/python36-dns-1.15.0-8.el7.noarch.rpm
>>>>> I think we are more lucky once RHEL 7.7 is out :-)
>>>> Can we use this:
>>>> https://centos.pkgs.org/7/epel-x86_64/python36-3.6.6-5.el7.x86_64.rp=
m.html
>>>>
>>>> It would be very helpful if we could have a python 3.6 baseline.
>>> I have a RHEL7 system and these python 3.6 rpms installed from EPEL:
>>>
>>> $ rpm -qa | grep python36
>>> python36-libs-3.6.6-5.el7.x86_64
>>> python36-crypto-2.6.1-16.el7.x86_64
>>> python36-devel-3.6.6-5.el7.x86_64
>>> python36-3.6.6-5.el7.x86_64
>>> python36-dns-1.15.0-8.el7.noarch
>>>
>>> That seems sufficient to run the AD testenvs on master. If those can =
be
>>> added to a CentOS7 image on gitlab, that might be sufficient to run t=
he
>>> tests.
>> So I guess it should be mostly a matter of adding EPEL repo during
>> bootstrap.  Currently it runs the same thing on all RPM based systems,=

>> but this can be changed.
>>
>> See bootstrap/config.py
> I tried to fixup the patches from Andreas to use Python 3.6 in CentOS7
> and force the new image build:
> https://gitlab.com/samba-team/devel/samba/pipelines/59674602
>
> The centos7 image build seems to succeed, but then the centos7-samba-o3=

> build does not start and only has:
>
> ERROR: Preparation failed: invalid reference format (executor_docker.go=
:168:0s)
> Will be retried in 3s ...
> ERROR: Job failed (system failure): invalid reference format (executor_=
docker.go:168:0s)
>
> Does that mean there is something wrong with the image or the tag?

Hi Christof:

This error is because $SAMBA_CI_CONTAINER_IMAGE_centos7 was not defined
in .gitlab-ci.yml, so you get empty string for image.

Also, your private jobs get stuck, because we replace the `private` tag
to `samba-ci-private` but we can not have both.

I fixed both issues and pushed to your branch, ci is in process now:

https://gitlab.com/samba-team/devel/samba/pipelines/59867359

>
> Christof

--=20
Joe Guo
joeg@catalyst.net.nz
Catalyst IT



