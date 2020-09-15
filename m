Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3192F269FF5
	for <lists+samba-technical@lfdr.de>; Tue, 15 Sep 2020 09:40:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=dNm4CG+jy2qxarwHqeMQOvAY4N9l13eMlAFI+CjXIgQ=; b=emuW1dfHIj69JHyl6H/8IPjK9F
	cFFMBQXiggFJ0CExwYum2peYxOGuXXb2siIwMnjWp8dVbEMx8WtvDTnHdf6hXvqiwh8jie3JRqU5C
	g8cJAL0uyMyTqByQ9pRdGzwcuYOc0omLNgawp6SZfVUOM6YUTpEs9Ndp/+/wwzCvLFnBlECUczSSP
	NPkjB3wLlV+NL+zmbVM+tsHI6S2Oz7H1rloI+/p4SuFHFzqmc0ayKrK2E1+yFt34wsppwVtWHAVnZ
	BL3YQ57ClALKf9UuKnlPcdYU40BzIy8UbhoC+S4g8BJIe+7MUoPFq7qneMnc9+LtUS/58Z+UgTSP8
	0MjlDCtg==;
Received: from localhost ([::1]:51606 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kI5ZC-005Re6-VU; Tue, 15 Sep 2020 07:39:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54726) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kI5Z7-005Rdz-95
 for samba-technical@lists.samba.org; Tue, 15 Sep 2020 07:39:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=dNm4CG+jy2qxarwHqeMQOvAY4N9l13eMlAFI+CjXIgQ=; b=onUjEavkdlzaAYqyt0shMq4JFo
 /5c7FpcyKtM7mSHdyqDNRJ3hoPxisDFqx2o4dmsXugCc3HmqcMmSzPBj5nCgrRrOVy+s3vSUTVSZx
 z8uCbtIFtBIW3v9xZvC9TYQmh6FRKysj4FZk+I00TgkzkJN1b8+wof/uyxMjHOvicr0ep2CL3YjCy
 u4PPrHv/EtND5K9HKtSXmEJSX1VYG4HUolLyVwQ3pBifBe+yoQ24+JP/K2rgen1HYhbrwqsnrEhTm
 0BH6kN2dbApyaNV/f+IUEs9BnyVwMjIcACe8A24q/nylyHxJi0J+byAWCUCW5jlCU62ShvERB0/9V
 BbafbUOWKiMdhuWlss0/JUvvXTZ6JrW5u2c5Jd8w3OSVw6spcW3OsOryDjuqKOd2JSoGIFqsy7oCR
 hBA1ck6TC3QGfiJcTDHvBd5f3qZ5zy1j4Q7lSGm21Vuz5vVGex1JysPYfdFsX5O6acUOaH5+XktEh
 h+15X0FL86uTAHqs/sOjk83h;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kI5Z5-0005w6-F0; Tue, 15 Sep 2020 07:39:48 +0000
Message-ID: <c98e756ee61403d845c5cba384c756224d2fd5bd.camel@samba.org>
Subject: Re: SELinux attributes in Samba domain
To: Rowland penny <rpenny@samba.org>, samba-technical@lists.samba.org
Date: Tue, 15 Sep 2020 19:39:41 +1200
In-Reply-To: <adf4a272-cd82-213d-d630-93bac4127812@samba.org>
References: <da8c5360-fe43-16e5-e149-657a22cbc61a@rosalinux.ru>
 <adf4a272-cd82-213d-d630-93bac4127812@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
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

On Tue, 2020-09-15 at 08:10 +0100, Rowland penny via samba-technical
wrote:
> On 15/09/2020 01:42, Mikhail Novosyolov via samba-technical wrote:
> > Hello everyone!
> > 
> > I am thinking about storing SELinux attributes of domain users in
> > Samba AD domain.
> > 
> > The problem is that Samba AD copies Windows domain, but there is no
> > SELinux in Windows.
> > 
> > Currently FreeIPA can store this as a server in LDAP and sssd can
> > get and apply SELinux attributes from FreeIPA's LDAP:
> > 
> > $ grep -inHr ipaSELinux
> > src/providers/ipa/ipa_config.h:34:#define
> > IPA_CONFIG_SELINUX_DEFAULT_USER_CTX "ipaSELinuxUserMapDefault"
> > src/providers/ipa/ipa_config.h:35:#define
> > IPA_CONFIG_SELINUX_MAP_ORDER "ipaSELinuxUserMapOrder"
> > src/providers/ipa/ipa_opts.c:271:    {
> > "ipa_selinux_usermap_object_class", "ipaselinuxusermap",
> > SYSDB_SELINUX_USERMAP_CLASS, NULL},
> > src/providers/ipa/ipa_opts.c:276:    {
> > "ipa_selinux_usermap_selinux_user", "ipaSELinuxUser",
> > SYSDB_SELINUX_USER, NULL},
> > 
> > In general it just gets a string and processes it, this email is
> > about storing that string inside the domain per user.
> > 
> > My question is: how can SELinux attributes be stored inside Samba?
> > I understand that it will not a standartized name (but maybe we can
> > come up to upstreamizing something into sssd...?), but I am ready
> > to keep with something not upstream for now and to try to make SSSD
> > to the same for selinux in Samba as it does in FreeIPA.
> > 
> > I think I should extend Samba's scheme with custom attributes like
> > in the guide 
> > http://david-latham.blogspot.com/2012/12/extending-ad-schema-on-samba4.html
> > And then try to make sssd read those values.
> > Does it sound like a not very bad approach?
> > 
> > Thanks!
> > 
> > 
> We have a wikipage about extending  the AD schema: 
> https://wiki.samba.org/index.php/Samba_AD_schema_extensions
> 
> Your problem will come with sssd, it isn't supported by Samba
> (because 
> we do not produce it and no little about it) and even Red-Hat no
> longer 
> supports it use with Samba.

For managing pure Linux clients it would be really awesome if we could
make this work well.  I've long dreamed that Samba be the ideal posix
directory server, because there is no good reason why it can't do that
as well as be an AD DC - why should sites have to run both FreeIPA and
Samba (and have the complexity of trusts) just to get really good
management of their Linux clients.

Rowland,

While the combination of Samba and sssd on the same host is a known
problem, outside this case we should work hard to have sssd be a great
domain member in Samba domains, just as much as we hope for good
outcomes for MacOS or Windows clients. 

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




