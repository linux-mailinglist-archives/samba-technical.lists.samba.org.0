Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 055A4543B8A
	for <lists+samba-technical@lfdr.de>; Wed,  8 Jun 2022 20:32:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=fz4rXZ0oMd8+KGKdUhkM77FkyiPuvgzqXyIEa2hVAIc=; b=3oY1D651fWcRh2nr8jhATmcEPu
	MyCVCYUOA+Fv1h5rnjeqtPxvjle1PdWwOZjFAQDMXvNUFEWxdmjECSp0ds3aeya03uQWVkPXLwiPe
	hhTseA05PGyPYDy+yVEv0hJ9jbEaSZh9FXq58isKctjv94lEcdrOr83+xXyYCnMPil5MhVReCgnIe
	BjohwFFbCYHE/1r1YK+EdxqPZL1nneUUmgfXHNZtho8qYcyiSHqibuGeh+EZwaOhtmIM/aPE/GHbu
	yKyPPsD0rdBkeFWLNjYPwqhcjHaKmRyUAxzVkvfXYoTirJRAzlIBOrM57gXq5HQ4f/V0uk3PAji4b
	0F5VRYLg==;
Received: from ip6-localhost ([::1]:65242 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nz0ST-008QAB-D8; Wed, 08 Jun 2022 18:31:09 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62164) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nz0SL-008QA1-Km
 for samba-technical@lists.samba.org; Wed, 08 Jun 2022 18:31:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=fz4rXZ0oMd8+KGKdUhkM77FkyiPuvgzqXyIEa2hVAIc=; b=a6F3iEYjCWSZXz91mqhY2d4R9H
 4NiZOgIw8VlomDXob+wl0Evxu7yH+56pzKEBNDMYySnSfh7krioMf2gKofcgWesEeksIgL35bQQqp
 3FUYlRjGc6KCbdoXXFmK2vpcxu/+YDWgQfpLjAFPfy1Mwo16XcsXlYetwVNS74C8O/LB4VUTJH9h4
 Rn2X0VGxdDBNrMOd582DjswFs4CKRaZQXlzHH+JSTq/zZi/eBioLuGLe6PyNzoaCskaP8aHxdeRKV
 oNy4+zeQA4/n28GqH9uRH+9yZN2SAAac8gUBVOJ0rkMYA9G83uYTiF0d9stpq7bFBFOEv+hfaKoeD
 m1jpvutaTI5BRqEU55rtpp2JqE/BnHDhbvlrRxiZ3+9H0/OyaqkvHdfodfFCa62WYwXwOoZxBe6h9
 Kw73zK/O5sd2JkKckw3KLDwZ8NyKem1OdJHkjndj0DvUhlVFKensuDJ7Wla2pH47w/4MfZMwppzST
 /lFLP1TkHG+ApsKMBPlUtfMr;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nz0SK-004cal-FU; Wed, 08 Jun 2022 18:31:00 +0000
Message-ID: <4f5b548b-ee32-cd2c-6359-de61f0d7f15f@samba.org>
Date: Wed, 8 Jun 2022 21:30:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: More Podman work needed
Content-Language: en-US
To: Andreas Schneider <asn@samba.org>, Andrew Bartlett <abartlet@samba.org>
References: <55008d104d4efc5c286e790836e1a6d4a01ea525.camel@samba.org>
 <1737413.VLH7GnMWUR@magrathea>
 <2f5a0903-d3bd-8833-6e3d-da3540124c2f@samba.org>
 <1924935.usQuhbGJ8B@magrathea>
In-Reply-To: <1924935.usQuhbGJ8B@magrathea>
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

On 6/8/22 19:22, Andreas Schneider wrote:
> 
> Maybe the rpmkey package is missing for the repo. Which repo was it?
> 
CentOS Stream 9 - BaseOS 
 
                                                              1.6 MB/s | 
1.6 kB     00:00
Importing GPG key 0x8483C65D:
  Userid     : "CentOS (CentOS Official Signing Key) <security@centos.org>"
  Fingerprint: 99DB 70FA E1D7 CE22 7FB6 4882 05B5 55B3 8483 C65D
  From       : /etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
Key imported successfully

