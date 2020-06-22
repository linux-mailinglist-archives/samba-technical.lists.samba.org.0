Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF1820321B
	for <lists+samba-technical@lfdr.de>; Mon, 22 Jun 2020 10:31:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Wd5Mj4ze699zmbZKkp1VugV6mN3v4xdv5MI2gacAZGA=; b=Nt6M0jqOnk/XZKYGnnxwHshTlk
	bvwa4s43LMu1bkrOLDijqb93yTIP3sViccXR/99cKyHdFQBcJPxG0cR1+Zr43gB6Jd4Cr5/wBV6N8
	uVMBsXnCnVEBWMhLzjbFieZrDmwC12NcSIwCWTZgNtg+4C7VX4PldyFakRHdUY9n7XA+VNBCcI9TZ
	YPqFlEknJgzjZN487Fp0GZMCERvykG0+wkHLMNc5wUoStBVXsmAwWBBDxgQA+lSGzZi3tjWVaIAiM
	vy6f5oVzllhIOpGtNkEzpJTpGYc4Rxy74I1EAWNa1HTKWV0WYqy5SBFxeQsRQ+L7JvdQ4faVVtjLK
	FRg00Xxg==;
Received: from localhost ([::1]:59918 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jnHr2-001jAW-3S; Mon, 22 Jun 2020 08:31:00 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:39271) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jnHqv-001jAP-B3
 for samba-technical@lists.samba.org; Mon, 22 Jun 2020 08:30:55 +0000
Received: from intern.sernet.de by mail.sernet.de with esmtps (Exim 4.92 #3)
 id 1jnHqu-0000GO-TZ; Mon, 22 Jun 2020 10:30:52 +0200
Received: by intern.sernet.de
 id 1jnHqu-0007kE-PB; Mon, 22 Jun 2020 10:30:52 +0200
To: Isaac Boukris <iboukris@gmail.com>
References: <CAC-fF8TH5sf6ekjfG5QqnEwG41fopV1bWOMxBH_UnodfjDo_qA@mail.gmail.com>
 <20200619181956.GF10191@jeremy-acer>
 <CAC-fF8SYbXaz33yJ_QaZzeYh2uBt3iKxHzbQNtMPm5qqwvAciQ@mail.gmail.com>
 <CAC-fF8Stst7BnrEKVQLP7og-HLp=T+NNoiSpUmRD3mwxXtK67Q@mail.gmail.com>
Organization: SerNet GmbH
Subject: Re: gitlab: testing of ldap-ssl-ads option
Message-ID: <20f59230-59fa-9946-3b4f-937cd1bf619a@sernet.de>
Date: Mon, 22 Jun 2020 10:30:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAC-fF8Stst7BnrEKVQLP7og-HLp=T+NNoiSpUmRD3mwxXtK67Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
From: =?utf-8?q?Bj=C3=B6rn_Baumbach_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Bj=c3=b6rn_Baumbach?= <bb@sernet.de>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 6/19/20 11:57 PM, Isaac Boukris via samba-technical wrote:
> On Fri, Jun 19, 2020 at 9:01 PM Isaac Boukris <iboukris@gmail.com> wrote:
>>
>> On Fri, Jun 19, 2020 at 8:20 PM Jeremy Allison <jra@samba.org> wrote:
>>>
>>> On Fri, Jun 19, 2020 at 07:45:28PM +0200, Isaac Boukris via samba-technical wrote:
>>>
>>>> Does anyone have any idea on this error and why I only get it on gitlab?
>>>
>>> My guess would be differing gnutls library
>>> versions. Not sure how to determine what
>>> gnutls library version is on gitlab.
>>
>> In the raw log I now see the host was "Ubuntu 18.04.4", i'll try that.
> 
> My bad, it was rather easy to reproduce, it only worked in my lab
> because I have 'TLS_REQCERT=allow' in ldap.conf.

For testing purposes I typically specify the ca cert the following way:

LDAPTLS_CACERT=/var/lib/samba/private/tls/ca.crt ldapsearch -H ...

Best regards,
Björn

-- 
SerNet GmbH, Bahnhofsallee 1b, 37081 Göttingen
phone: 0551-370000-0, mailto:kontakt@sernet.de
Gesch.F.: Dr. Johannes Loxen und Reinhild Jung
AG Göttingen: HR-B 2816 - http://www.sernet.de

