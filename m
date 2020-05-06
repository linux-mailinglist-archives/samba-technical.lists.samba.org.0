Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6871C79B1
	for <lists+samba-technical@lfdr.de>; Wed,  6 May 2020 20:54:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Cc:Subject:to;
	bh=gmbv78uem//+IXDi/welxBDGmWf8xaw4cjGpLc3qSTI=; b=MAaHiGt/j9WaYbIFAOCvXWG2Za
	RZk32mRkbKDNbHQEvvyAmwNRO53nLbOkvvzwq+vK0c2FqU3DuTz8i5V6G301f57jJVTz/Py+pBtI/
	hkOf63uBxqh8sWCiz/vDWCYJTepCreRFDcLclMTFtKE5CivDxUpemRYVMWna1Ci9Z87RdbQpt0fPA
	n9bYJo/G31Ci7WEdyPhCtTQYEMpzMDH/OOIs/IsHRfR7peXbx6Tvm4FMxOfsIAivvKq0E7sGX9yig
	3Tb7lz16detm2D75/NIV5JxrVh/W1S0ep1qty75FMvls8zHxMO83EDkSACntXHbxAAMsRdWuNsUJ4
	i1kaRhxg==;
Received: from localhost ([::1]:51530 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jWPAZ-0033Rm-Tz; Wed, 06 May 2020 18:53:24 +0000
Received: from sonic302-21.consmr.mail.ir2.yahoo.com ([87.248.110.84]:45143) 
 by hr1.samba.org with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim) id 1jWPAQ-0033RH-Nh
 for samba-technical@lists.samba.org; Wed, 06 May 2020 18:53:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.uk; s=s2048;
 t=1588791189; bh=gmbv78uem//+IXDi/welxBDGmWf8xaw4cjGpLc3qSTI=;
 h=Subject:Cc:References:From:Date:In-Reply-To:From:Subject;
 b=ujKyrmrlxAEBhwRRjjtqRwJIC6pOW32lkYxysA/uq3DtapAZOOPbtkz7WkJLW9YbjwujRAElzlzGVxaDV4SlDL4pJ+CtiXAkQFm0C5KvAAP/vyxiKi04N++vUDZAKmEt67D1HcGGvQcqh8R0F3aiS7mLEenBHNUHxkbDcApTp53l01pgRPymJSmZXqdyN2hxCAo62AOH6TFzBKOCmoj5PhFhHpgTKi8qzFKN8cQayETsPkirMh7SXiZeMX9k1A7F1Ok7Z/J3DCsJsm3XFPq5c9wo7l7/WBXLP2VTel03rTF+GC2KSXgMiYBQ2UjMaTjphBGv0ewZVg3JF7lWwEi/9w==
X-YMail-OSG: 9zTdKsAVM1nLYriN79lrFN4BVttQk7RW6JkJYbVMdY0B8KsKdRIQyRvN3b_zFlg
 GirUOxHJUCMzY7LKoQtaN6SROWrL4rnW9c6fS4YjrQchRmeeeTxImttjeSqbWxTDUgXU.yfuAHZm
 nz0rPp19q08014L.fAfLQyH89sBZqqNewEUv_wW9tQySiHqqDeyFIzkRdVNJAID7bErC1G.ysfBF
 cPUpDb6dICHAk8I92y8swfa.VZDlBJRQluGURDxcHooBD006voCEZi8kgtRsnINWJuojsHpxuC51
 1ivtDwKgjvPzxypzcWAEV6MqshJpn4OUE4vGZCre6sxu39vW3VZ4KUcqzRPrA3n1M1ilJDEwfkwH
 aRp4k3ZK34vkQUnE7etkGxjPYgQ0qUlqghBXTUX.Uvkx2xXzWtw_1aVOXca6n9tlBmr0rDxGikLB
 NjqGcSeQF7XpUwsEbP6.A7VkJqJUQVHc60qJn6phYlZbPQTs4Qs0kWcDnjCCeyVpPtfnB5aIgCBO
 66XG4za4Hi9oHOfmgX6GhdzCSYaF1VQ8hY83Mv.HUcVnVmjL5pL8_f6TmaaMdxMHlgPDBqL4C.On
 oibShpgo9hrttEhLLGl5wW1YTmJZGfivQO3Z61.CEPgx0kTgbanfXK4lZRezo9D7yyedmsYw6lBZ
 BVMpD2fF140QfzWPTNnrAhD8TWBg32jmHwc7qaRq8wP396Grv9JQvPaCRRSOgvWJSz2v364QIVTr
 dZEme.IBSmen2y1NjZiIez1tm3RofwKwzSDaLX._GyeXua9lN.T4YHvKSu3phv2hj.SaITiKnYOu
 jMJYN94W4Ck5o1wn3XLdUE0e.cYCqQoaR78q4UUXXbOkP9qrenZcudTxlySEkQzztIJtdWeKS3K8
 0zOmT5h0XV3x5ywtUgVJRYU0O7IjswR6Q1I47LE6G67KZX7fztpfNz1ak.m2NFJl588uSmPFGo9C
 iM3I31zSqhK4KYvrUO9qqqaMTWwczVUnbTcnt47F8aKTpLBCHa8hOmnYy1_gCf1.tti2AHC5gVTA
 NqFcXaHiL7g_KWuvkddYUPDNsEUYhbLRL9j7VwwWl7WpJBcaRalEk4ezSMvmp6bGfjwKSmB_.w3Y
 _GEx.XcfR.ZgjKZ.oSQtmpwE8zzJ1nmUC34O4jK8lrp8TCRxFQ4X7xW3acIY3bN1g3cOBZ2ikPjE
 HLl_g9ygdS8Yn7nW0kVL9Xnw8xhoKdqeei3sRW1uHvGpNFN8XWm9ETbWE_7kdTAWZrYVpA53D6k0
 zTy1rxTDag5ioAiIT5kyATj4dDMMrqg_onIT_xDNmOxybL0V3zKoOw6L10d6kS3i0zgWhQHu.VLI
 TDCqvudf8x8XTJoyC3gUopWMzvIuleyYWstUK7.mflrOvdP2fxkHsO_IS_TTq.c2CZoHcQ0dgdt5
 irlBKrfA_2VbFv_DM
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic302.consmr.mail.ir2.yahoo.com with HTTP; Wed, 6 May 2020 18:53:09 +0000
Received: by smtp412.mail.ir2.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
 ID c0990f20178534ec77ef01c5baec2a37; 
 Wed, 06 May 2020 18:43:00 +0000 (UTC)
Subject: Re: Samba with GlusterFS - the bug is back?
Cc: Samba Technical <samba-technical@lists.samba.org>
References: <4b3fdecf-e666-dd76-d618-0150b2549f07.ref@yahoo.co.uk>
 <4b3fdecf-e666-dd76-d618-0150b2549f07@yahoo.co.uk>
 <20200506170946.GB3447@jeremy-acer>
X-Pep-Version: 2.0
Message-ID: <b6a5d458-6b60-3088-eb3d-94d7ce839528@yahoo.co.uk>
Date: Wed, 6 May 2020 19:42:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200506170946.GB3447@jeremy-acer>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Mailer: WebService/1.1.15756 hermes Apache-HttpAsyncClient/4.1.4
 (Java/11.0.6)
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
From: lejeczek via samba-technical <samba-technical@lists.samba.org>
Reply-To: lejeczek <peljasz@yahoo.co.uk>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



On 06/05/2020 18:09, Jeremy Allison wrote:
> On Wed, May 06, 2020 at 09:00:34AM +0100, lejeczek via samba-technical =
wrote:
>> hi guys,
>>
>> I fear this or very similar - https://bugzilla.samba.org/show_bug.cgi?=
id=3D13585 - is back and I wonder(must be no me alone): would that be(if =
this same old bug) Centos maintainers' fuckup or it's in the upstream?
>> samba-4.10.4-10.el7.x86_64
>> glusterfs-server-6.9-1.el7.x86_64
>> If anybody here is a glusterfs mail list consumer, then it's "Unable t=
o create new files or folders using samba and vfs_glusterfs"
>>
>> I'll say this is a small catastrophe, once again, for all those of us =
who run with glusterfs.
>> Would you have advice with a quick fix and/or workaround?
>> many thanks, L.
> Can you re-open a new bug and assign to Anoop. He's probably
> got the resources already set up to look at this.
>
> What Linux distro are you on ?
Sorry, can't do. I'm not an account holder over there at
samba.org and as you can see I come with Yahoo. Someone else
will have to do that please.
I'm on Centos 7.8 and I've already poked at centos' devel
mail list, also Gluster's.
I took a look at what's in the patch(es) for <4.10v and to
me(not a developer!) it seems that, that code(from Centos'
rpm.src) is patched in(as oppose to via external patched)
already. Yet the error I get is the same(or similar) as then:

"The file '<%1 NULL:NameDest>' is too large for the destination file syst=
em."

many thanks, L.



