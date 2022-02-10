Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 238EC4B048A
	for <lists+samba-technical@lfdr.de>; Thu, 10 Feb 2022 05:40:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=0vaYaOfKvtJXSA1U3iuelIbTncd1Zas77NXuxDl/Mi8=; b=ir76/CVl/C2XMObG1IG4gBsuFO
	RgP59wvcsVOFbRpNdgNwZclk4cW0uZwtvArqLrtzLzkHrSzr/U/ok1ep6VOwMY229u5Lx6o5vKDJs
	1ZW8gkvu87+cjl+2HzYK/+RM9Vr0l+tgbqtZwh8zLVu7raGeZezftICr4KtWRnH1jt245eKWFkcNK
	XdigrF8OQLepTIVHBE0yULp4LacSB3GI7SmFhhuSFV43tG8jXkX8TpNTG8HjPsrhXxXKnwTr/8RqH
	Z9VAH6eSajX/hwI3gAw1LFq3mhufItFXR0ov/whRMyFjCOYkYI4eu2vsWLMZhgkNcT617K5QUprm2
	mA8wRZ7Q==;
Received: from ip6-localhost ([::1]:21398 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nI1EZ-0063WA-3Y; Thu, 10 Feb 2022 04:39:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48812) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nI1ES-0063W1-7v
 for samba-technical@lists.samba.org; Thu, 10 Feb 2022 04:39:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=0vaYaOfKvtJXSA1U3iuelIbTncd1Zas77NXuxDl/Mi8=; b=EpVx6KzJ4n/h3WRUTJvjZHHMrq
 QOl6zvH2CfCfHI2MvSiqp+Nq7TZIbv2Bub7k8TDmNKH0P12bAUw34AAPepML9d97z5nQRmyrx0y69
 2bamsXX1H5oF6cCmoRDTvpthPSYvomd9/4zTktWdqvEvHMX80sKdE802bfJnWlVf4r31XmzJ3Bby5
 Se3D1Q4CESsBWOLjw43Q8RUqFRvmZA+q40wtNgWXdYRKcD+rxo8P4uwc9Ikr4avokd5ht7jn/Kfu4
 2u3evs6Jj8lGFLefZslIHInJ+HdzSYBoa7qSqH7DrhM1hKfCLbmvi+Z/agJmqm9Ds6o83RbC3QlrQ
 54WnkCpp1ycp1LbUA2bCAJ/ifpeGIWnNIM7NjQmMqCS+B6A1pzrL5KDc2KIoJghJiwBC9aLjSdhgo
 cRmVe3/n0b9MprW5rQPe08D1hGLb1NKuhA+gT1A33iBmmTkhHRC8VybVRlKWMEABAinuf7DGksF+V
 VutsAWw7ze3aP3/zTDUxgj+u;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nI1EP-00314j-9b; Thu, 10 Feb 2022 04:38:58 +0000
Message-ID: <4c25d80bbe82276c6738b7d440edb73477254a12.camel@samba.org>
Subject: Samba on OS/2 derivative ArcaOS
To: Paul Smedley <paul@smedley.id.au>, samba-technical@lists.samba.org
Date: Thu, 10 Feb 2022 17:38:50 +1300
In-Reply-To: <b77b6916-626f-22cc-2885-80936e76280a@smedley.id.au>
References: <53125588031f8ffad9e7c8a4b16a7f093781a39f.camel@samba.org>
 <28c3b502-7146-4403-b728-4815dafa9110@samba.org>
 <4406c0a37ed78d50bef9d10198fb6e565e633588.camel@samba.org>
 <YgH8F7/VoCe0pUyv@jeremy-acer>
 <9366e519039acf37002ab5f99c9038d378550e4b.camel@samba.org>
 <b77b6916-626f-22cc-2885-80936e76280a@smedley.id.au>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Thu, 2022-02-10 at 08:58 +1030, Paul Smedley via samba-technical
wrote:
> Hey Andrew,
> 
> On 9/2/22 08:44, Andrew Bartlett via samba-technical wrote:
> > Björn, after reading the discussion here is your position still
> > that we
> > need to retain LanMan authentication for DOS, OS/2, Win3.11 and
> > Win9X?
> 
> I'm not Björn, but speaking as someone who has some involvement in 
> ArcaOS (https://www.arcanoae.com/) which is the modern day successor
> to 
> OS/2, ArcaOS ships a client currently based on Samba 4.11.x so there
> is 
> a pathway for OS/2 users to update their CIFS.

It would be great to get that updated to current Samba, as Samba 4.11
is out of support.  Is there any particular reason a more modern
version isn't used?

Thanks,

Andrew

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


