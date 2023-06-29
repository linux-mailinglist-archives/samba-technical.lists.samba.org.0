Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C01A74237A
	for <lists+samba-technical@lfdr.de>; Thu, 29 Jun 2023 11:49:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=MYVMILkePKC9dqZ5dU2Vr2T+1iT0dZw9QeNEg9y7uyo=; b=NEOawMUW+aHFhaX50HGO/RJCwJ
	SVnVOvy4BmGWuQixv9NQDxR+1/BkSaBUcOOoo0va+D7RaZFwEEO3RE2LX1AlcOu7dhNMfo3Xx465i
	mHbneiZn7oawmbO6GniK/bNIQS/bpEOE/yUucrJheTP1mUgRw60Zg3K2EMaw/w0Fpz0tfaew4Lsje
	CUf9/P1YXo7/v3sR5wtHC8SgrLztxZ1KIk24lXOhPv3WGMx98DE3GC0299JOPTtVXs0yRBvC+ipo2
	Uk1Qy5WAOiV/e2XYqWuCuibFe6MoiD3ByThhQDvE9PsDcuQO6NQ+3466VG3NqRTL3F2YwhHWwfFqs
	s9MGJlIg==;
Received: from ip6-localhost ([::1]:32406 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qEoGP-005BfV-HK; Thu, 29 Jun 2023 09:48:33 +0000
Received: from lilac.mail.einfra.hu ([2001:738:0:415::6]:52856) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qEoGI-005BfM-AR
 for samba-technical@lists.samba.org; Thu, 29 Jun 2023 09:48:30 +0000
Received: from [2a02:ab88:38c:6f80:c8ed:21eb:3f5b:9f9] (helo=fin)
 by lilac.mail.einfra.hu with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <wferi@niif.hu>)
 id 1qEoGD-0000s4-Qd; Thu, 29 Jun 2023 11:48:22 +0200
Received: from wferi by fin with local (Exim 4.94.2)
 (envelope-from <wferi@niif.hu>)
 id 1qEoGA-002EzX-Rt; Thu, 29 Jun 2023 11:48:18 +0200
To: Jeremy Allison <jra@samba.org>
Subject: Re: Is this a real memory leak?
References: <87v8f9gpbo.fsf@fin.soreny> <ZJsgx2j0foTkcE6m@jeremy-rocky-laptop>
Date: Thu, 29 Jun 2023 11:48:18 +0200
In-Reply-To: <ZJsgx2j0foTkcE6m@jeremy-rocky-laptop> (Jeremy Allison's message
 of "Tue, 27 Jun 2023 10:47:51 -0700")
Message-ID: <87y1k2fvkt.fsf@fin.soreny>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
From: =?utf-8?q?Ferenc_W=C3=A1gner_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?utf-8?Q?Ferenc_W=C3=A1gner?= <wferi@niif.hu>
Cc: wferi@niif.hu, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Jeremy Allison <jra@samba.org> writes:

> On Tue, Jun 27, 2023 at 12:41:15PM +0200, Ferenc W=C3=A1gner via samba-te=
chnical wrote:
>
>> Please take a look at the following patch, taken from
>> https://github.com/balabit-deps/balabit-os-8-samba/commit/5f46ae6282db14=
57b8ef8bbfb4e97eb4aadd55b4:
>>
>> From 5f46ae6282db1457b8ef8bbfb4e97eb4aadd55b4 Mon Sep 17 00:00:00 2001
>> From: Balazs Scheidler <bazsi@balabit.hu>
>> Date: Wed, 22 Aug 2012 11:34:43 +0200
>> Subject: [PATCH] nsswitch/libwbclient: fixed a memory leak in wbcAuthent=
icateUserEx
>>
>> (cherry picked from commit zorp-os-5.0 / f0e88410bd2528517910f780d71e63f=
8effb91ef)
>> ---
>> nsswitch/libwbclient/wbc_pam.c | 1 +
>> 1 file changed, 1 insertion(+)
>>
>> diff --git a/nsswitch/libwbclient/wbc_pam.c b/nsswitch/libwbclient/wbc_p=
am.c
>> index e4cd2963..b16c9424 100644
>> --- a/nsswitch/libwbclient/wbc_pam.c
>> +++ b/nsswitch/libwbclient/wbc_pam.c
>> @@ -415,6 +415,7 @@ wbcErr wbcCtxAuthenticateUserEx(struct wbcContext *c=
tx,
>>                                  params->domain_name,
>>                                  sep_response.data.info.winbind_separato=
r,
>>                                  params->account_name);
>> +                       winbindd_free_response(&sep_response);
>>                 } else {
>>                         strncpy(request.data.auth.user,
>>                                 params->account_name,
>>
>> Do you agree that this patches an actual memory leak?  If so, would you
>> please consider taking it?
>
> Thanks Ferenc, this does look like a real memory leak to me.

Thanks for taking the time, Jeremy!  What could I do to get this
included in Samba, what's the preferred process for submitting patches?
--=20
Regards,
Feri.

