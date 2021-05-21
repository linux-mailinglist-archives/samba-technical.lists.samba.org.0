Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 369F838C7BF
	for <lists+samba-technical@lfdr.de>; Fri, 21 May 2021 15:23:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:subject:cc;
	bh=b1uMt2QJoGPCNQTbDoMIxUcMnvlzYDV1vrcG99bfDR8=; b=Gg3DZy7jh4jOjLofz24wwKK3p3
	gdLyhk7ztd5YpLktudxJ3DPZLByZ2PqT0fjjlHCoRLhKKrrk/3alM8lSLYk4T0Q2kLY0gZptcg2OQ
	RZRbte9SdJY6lrDcrU7Eog9bzDCM56rOA3muqoTsSMu+eKGtxdYC3KIl3jcQPR7q4QQS3/gXSyl8W
	FPTFCaJ2baKiQwWQnuLi6HAmiKJbnJBGD2IvEo8FGy20gLQYnJtN8dXd15p3u97RvhI7cW+DIdAJF
	vxYkmtRLUZrLfaSl3ok4v0DeQv2nJQT3iruawST0YcfCcdc3oHyzCvIWx9gTrT3lMIRjQOSziTaxn
	mZJRX4sw==;
Received: from ip6-localhost ([::1]:41874 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lk56U-002fae-Nl; Fri, 21 May 2021 13:22:14 +0000
Received: from mail.itsd.de ([80.153.216.99]:24686) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lk56O-002faV-La
 for samba-technical@lists.samba.org; Fri, 21 May 2021 13:22:11 +0000
Received: from mail.itsd.de (mail.itsd.de [192.168.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by securemail.itsd.de (Postfix) with ESMTPS;
 Fri, 21 May 2021 15:22:05 +0200 (CEST)
Received: from nero.itsd.de (unknown [192.168.0.223])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.itsd.de (Postfix) with ESMTPSA id B8834800D6;
 Fri, 21 May 2021 15:22:04 +0200 (CEST)
subject: Re: Problem with AD membership in an AD with more the 100.000 group
 (possible regression in 4.12?)
To: Andrew Bartlett <abartlet@samba.org>, samba-technical@lists.samba.org
References: <d7b0ec24-3c59-1d74-9e93-616eebe6eb44@itsd.de>
 <5d5b4c230813b6bd6b3001fe14bfd3a9d8ca2b53.camel@samba.org>
 <9d2ed0c9-9e13-2848-29cb-aaf6354e33aa@itsd.de>
 <c4713dc0b0d746c834ec66c1ec793572c725b2d2.camel@samba.org>
 <2da32b9f-8ba0-c1ab-1748-831eeb727f0f@itsd.de>
 <1911c4eeee7df0fcf1f13d612da214094a9198c0.camel@samba.org>
 <b6fb9ef1-3cbf-e970-eb2e-9e6e395c65ae@itsd.de>
 <b83d52e7a5b846fd429811616f3b3c21d2f55480.camel@samba.org>
 <56d3287c51dc769806d8a4966b54e2a6e672d8b0.camel@samba.org>
 <fd178861288df9613902ecec24e52f6a2786cea9.camel@samba.org>
Organization: itsystems Deutschland AG
Message-ID: <644dd37c-1260-ccd4-f1ff-0bc32c7b3a64@itsd.de>
Date: Fri, 21 May 2021 15:22:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <fd178861288df9613902ecec24e52f6a2786cea9.camel@samba.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: de-DE
X-SM-outgoing: yes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=itsd.de; h=subject:to
 :references:from:message-id:date:mime-version:in-reply-to
 :content-type:content-transfer-encoding; s=default; bh=vNooXaDNn
 XTvfgH5iO+Wy2MFiTJZycseHalcZcIdNt4=; b=BUV2b7sHeAt5PsnSaX9+kr+Dq
 N8Ba7sinjOFGAmCoig1Oc+cRJDKYERe0W0i3YOpU1HmK+0TYcOqhy2slGN51kgr/
 bJP6bG9lT7ll4MXXTMJpmh47oWGcuyojYWOiEFgVj4rI8m63FjbrHPz/lhsDeYnI
 vJieAp0vG8YomBSxjFKVpdTC1yDKS9+ukxVitwOx52GLG0JcvoAn0hDerdzQyVvn
 nBu/vJisidQcGkdUsCnz7Ei/SCXjbmJ9OJ1i4wVeT49MSdX0hrV93qX3wkPHQb16
 H3jZOIzpVR5qfme/i7YuTkWFLeBs/vONqMPbpd/kAf8tNP7QP1Qg5cFgHPQwg==
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
From: =?utf-8?q?Dr=2E_Hansj=C3=B6rg_Maurer_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Dr=2e_Hansj=c3=b6rg_Maurer?= <hansjoerg.maurer@itsd.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 21.05.21 um 11:31 schrieb Andrew Bartlett:
> On Thu, 2021-05-20 at 23:29 +1200, Andrew Bartlett wrote:
>
> Just be aware that this isn't a working patch (see the failed
> pipeline).
>
> I'm not sure if I'll be able to get this approach to work, sadly.
>
> Andrew Bartlett
>
Hi Andrew

strange ... I have been able to apply the patch to 4.14.4 with one 
manual fix in
librpc/wscript_build

and the patched and compiled 4.14.4 fixes our wbinfo -g problem

[root@c8-test01 ~]# wbinfo -g  | wc -l
128167

Regards

Hansjörg




