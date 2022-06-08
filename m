Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5235D5432B9
	for <lists+samba-technical@lfdr.de>; Wed,  8 Jun 2022 16:37:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=kBae9/irbAFy2pmLJ1TaZ8kGBfYpfF9Owp+INBIkeUU=; b=NZfl3M0KjGZbJ77nR8bRTuUeb/
	8xX+FmcEkoCZTj5NIzpzf+nVnjF2u2reRLcQGdE5X6/fbAiqASK3D7ZruiE9HEnH2/oc7xsBfnNrj
	8dYYWiHni7cFzyqW8+IuqulYpEhYw31FDSEwzXNIMI6y86Arp1Fs0vDCTW0wWxx0xrVW+OfppMfgW
	M4plvLirbKNWpNbtiiVVGyuuhx37mcPm2g/xVVlGhhCrskyK2QESag0hcTD+j/qx5Rp03fDloFJQ1
	sqKDjdRf0PthTV3erDOnk4VRGg7Y9zjk+jPUflzZ3HalQ1AyAE1Qnu+DdQpDPK0o3jIIvQpWDgb7q
	jH0eJvew==;
Received: from ip6-localhost ([::1]:57570 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nywo2-008MXH-Bt; Wed, 08 Jun 2022 14:37:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62154) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nywnx-008MX8-MP
 for samba-technical@lists.samba.org; Wed, 08 Jun 2022 14:37:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=kBae9/irbAFy2pmLJ1TaZ8kGBfYpfF9Owp+INBIkeUU=; b=yzbKA91LnXw9+NuGTsVfzSDPSu
 jxc8aWt9p6XRnpIQrM1JX4iYGClpy8i3T4fQtYOWvaSbmeRcaRqe+Z6RDYZcT/JgbsEqTlnkbvnip
 lSlEJJD7YVgTMcsLJL+wcYjXydylMXEhuDrkHhHgcNqKWpAlhA8sOIlYRhxiouRN+R8FhMmK1HS/r
 GjV+D95Il/tPBF3GOQ2BJN1qD4Sr7ZzsKzr1vzP18FU158w3/4s19CU+gCpVbf3PBqF1hSWhrTjt3
 cNNGR49+StSPfnPa1KmEkPoqUs83BfYkUsppCiu7RY8Eg+hzgY8F5QYqDQ32Rmd0Xw3ZBmyFjFBOg
 AiHjrs0W3lbRSsax+hMl7XVFPuWExbwv5j3Hb9VohnWS2ol83hACDywFFgOHcf5r82bUY9NhowgCb
 1ev94h4pq4WITxdS6noMWQvimBpwKcOd/9mxmzeld2nP832W9c+Ac8qeOBcpjiv1TiDOFEhuOwGwu
 A2vLtqVeAbi+DvwrSyjjeRjJ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nywnw-004aq9-Ea; Wed, 08 Jun 2022 14:37:04 +0000
Message-ID: <2f5a0903-d3bd-8833-6e3d-da3540124c2f@samba.org>
Date: Wed, 8 Jun 2022 17:36:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Andreas Schneider <asn@samba.org>, Andrew Bartlett <abartlet@samba.org>
References: <55008d104d4efc5c286e790836e1a6d4a01ea525.camel@samba.org>
 <1737413.VLH7GnMWUR@magrathea>
Subject: Re: More Podman work needed
In-Reply-To: <1737413.VLH7GnMWUR@magrathea>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Uri Simchoni via samba-technical <samba-technical@lists.samba.org>
Reply-To: Uri Simchoni <uri@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I chose the quay.io/podman/stable image because it seemed to have 
everything we need to carry out the process but come to think of it, I 
see no harm in installing packages as a preliminary step in the build 
pipeline. The extra cost of installing packages isn't significant 
considering that we rebuild images less than once per week.

So we can start with centos/centos:stream9 and install podman and 
diffutils and whatever else is needed as a first step.

One thing that did strike me as odd concerning 
quay.io/centos/centos:stream9 was that when installing packages I had to 
OK the installation of a GPG key, and I wonder why those don't come 
pre-installed on the image and how can I trust the repository if I don't 
have the keys pre-installed (or maybe I can just forget about package 
signatures, if we already trust distro repos in the image building process).

Does that seem reasonable?

On 6/8/22 15:03, Andreas Schneider wrote:
> On Wednesday, June 8, 2022 5:23:09 AM CEST Andrew Bartlett via samba-technical
> wrote:
>> Kia Ora Uri,
>>
>> Thanks so much for the podman work, this was awesome!
>>
>> We have had a couple of niggles on the CI recently, and one was
>> that quay.io/podman/stable is following Fedora images fairly closely,
>> and 'diff' got dropped from fedora 36 by default.  Ouch!
> 
> I would suggest to use CentOS 9 Stream
> 
> https://quay.io/repository/centos/centos?tab=tags <<< stream9
> 
> instead.
> 
> 


