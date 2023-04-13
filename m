Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AC66E0958
	for <lists+samba-technical@lfdr.de>; Thu, 13 Apr 2023 10:52:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=qjvIATCpYc+tcvnSPHFZCYDeK4SNRvdly54dakM9HNM=; b=Uf2fhyInyfFxZfRp+9Ysk6uFN7
	4a1eH6OEK1MSlsrsRrNON8VtZCNIJWQQqB1rpm9ZimCY4Jb5CNgNuL+/80+cjAfLYlzHJgRyngGu0
	GuX7sKTrC7ltM4K8rKXmk5zaXfEFRjiUIL0qRgkxCMAgwOGisBCstC2N7V+8ZL7ekv+tNB4qeOaHn
	SF22fVdjEo7JRsXBm9XH4tfghGSbHabdd9oc37UhqJMfjuDrpDmQE0WKRrcEmwakfHgh/v0j50LQE
	yvC80m78XbajgapUMRqVgKV8EyQGdGXVqRbL+ELN9VuivqPlPGEkT4PAzcFke281IKipSIOd7WE32
	d6AFVnvg==;
Received: from ip6-localhost ([::1]:36290 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pmsgS-0012Tg-8I; Thu, 13 Apr 2023 08:52:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42624) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pmsgN-0012TX-UQ
 for samba-technical@lists.samba.org; Thu, 13 Apr 2023 08:51:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=qjvIATCpYc+tcvnSPHFZCYDeK4SNRvdly54dakM9HNM=; b=I2blb54sYCUbcZxMSVEuqLpIQ1
 PoqQHaw5OVzS7Ud1HzJGOSVoA069iy4ZwCVh9loMIl/0p19K7OVXhvUUmnKt+yhsPIWXP4B9h0hX4
 1alURv/fd9UkXxUuaMJQN5klEN0g3HnPIsjlOKHqd2x5O0PTFtV4M7WeAPvHImwztBismm+9d7gz0
 C+2RJtvJZ/KTCKeP4F5RUwno82oyDtbyydMktBgafmora+we2DtP7IGXXNX1+ZkgBKnNKt1cbJyrI
 Z9AMnUEndw+04u0tEs7r6igQpjhAoFg+wtMDpAUcBKiqRPPWQAwFaR93mP4wjCzwDflqZRowQS2KL
 bhgvxr3VE/ASZ2XILLgf/h+iDpBdv1yfHhpON1ZmsEWU9dv9Vj/T3eCqy735nngL82NO7fDCJHom+
 kfn66rcTmPAOAzXAAa5hhdC0scKwf5eRfe7lhqEoCRP0mXf24dkzL/WWSYo1cPopUsoweLuLkaEg2
 9xyRcM3WhzkH4PJiQ7qDuhY7;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pmsgL-000u6t-JV; Thu, 13 Apr 2023 08:51:53 +0000
To: samba-technical@lists.samba.org
Subject: Re: The strange issues happening with ad_dc_ntvfs environment
Date: Thu, 13 Apr 2023 10:51:52 +0200
Message-ID: <13246326.uLZWGnKmhe@magrathea>
In-Reply-To: <8c78e366-5b95-f407-3ca2-2dc561b1d2f2@catalyst.net.nz>
References: <2142927.irdbgypaU6@magrathea>
 <8c78e366-5b95-f407-3ca2-2dc561b1d2f2@catalyst.net.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thursday, 13 April 2023 06:18:16 CEST Douglas Bagnall via samba-technical 
wrote:
> On 13/04/23 05:35, Andreas Schneider via samba-technical wrote:
> > Hi,
> > 
> > there are strange things going on with the ad_dc_ntvfs environment. You
> > can
> > see it very well with the samba.tests.samba_tool.user.ad_dc_ntvfs test
> > now.
> > 
> > I've created a patch that samba-tool consistently uses LDAP and not a mix
> > it with local operations.
> > 
> > This fixed a lot of issues. However there is a test called
> > `test_setpassword` which calls 'samba-tool user syncpassword' which can't
> > use LDAP. So I've passed it the configuration. However this test fails
> > now, see attached log.
> > 
> > Is it possible that the samba process restarted and works on different
> > databases now?
> > Any other ideas?
> 
> No.
> 
> Is this with a full make test, like you were doing in February? I can
> have a go at that overnight on Ubuntu 22.04.

Yes, I'm still trying to get this working downstream and I think this should 
still work even if CI/autobuild is not running a full make test anymore.

This seems to be a bug in some test and we should fix it.

> First I'll try `make test TESTS=ntvfs`, just in case that works.

If I run

  make -j8 test TESTS="ad_dc_ntvfs s4member"

it passes just fine :-(


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



