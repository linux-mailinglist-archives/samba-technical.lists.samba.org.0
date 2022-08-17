Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7868759683C
	for <lists+samba-technical@lfdr.de>; Wed, 17 Aug 2022 06:35:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=KCLVroMuBteTYjcy64/ZQKWupRLLTo9ytt0/i79spSg=; b=EByqv4fZoHMT6zkfaSMme0nMkO
	rpq4Pb93wVKTixgkjKLYgUdo3YA+5+/zOXhW0u5JoHr8zR0WhZhm2/VK8T+Y18oNUZDcodLq/JH2N
	llgpVQ/5+e+aqWfOI3QyUoji5O6qy/laCaEjCGeti6kiGsQ+N5CsgMIm3YpTNr1TDHY403Ifrb720
	+POsK4msOAqsxZwQiqdAO919x9Nt2ZaeO24l0LzPmljWHCykYMxUrPUhUYt3VHPLuE1IURmSS5JXy
	upnnYX+QKS4qbPRISfg0uG0QHUwc4HC6RSSyVtOLWIcP8u/JkvaBWeoSAm0jkBSk8OiygcXHgayYX
	5TjfoJCw==;
Received: from ip6-localhost ([::1]:45506 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oOAll-000MLJ-W9; Wed, 17 Aug 2022 04:35:06 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:44741) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oOAlf-000ML7-BU
 for samba-technical@lists.samba.org; Wed, 17 Aug 2022 04:35:03 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id mk9so9342291qvb.11
 for <samba-technical@lists.samba.org>; Tue, 16 Aug 2022 21:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mattgrant-net-nz.20210112.gappssmtp.com; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc; bh=9wDIqY1Zan8rvqHQHn1t8Pi8uT9vpBT85Z/2v3cZudA=;
 b=ybVVIaifTAzF5Tx5mGCYIh5fSg2feIOOMCJ3ir2xNFTS9RNEE6j3NsJhF4SvyIkhlc
 FyR41qL6E8pjzuTbEMP947dAkN0REqP3P/CY/0jns/n4ZeBX58e9bPfIxedUXQFjpVzI
 +7FcWbnFgJ8M3K25f8j/UcKNfhhKzLV1ZtoZBRfSXPUrII4zhsyAaY8orVQ+f3VEvEqO
 TBRoHYoCUxcwHNM8VMaxjh/CHxavpveZ7CL99MkWMg1ID75ZKyYqiYAtHKqap5ttbZS7
 z+HuBK8dZfp0t43tgglOdU6Jcrb/2XPo0goZWiU/SoYaZHnlWoyRBcPm4gKOp1mKbOlP
 tS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc;
 bh=9wDIqY1Zan8rvqHQHn1t8Pi8uT9vpBT85Z/2v3cZudA=;
 b=Ww0+kOft2PkhJpWLOBqd25d4kbq59h6jx9ZMZvstf2GtWFZbIFT4391oacwTWXDXtV
 vKOZ2oxJpUbuSiAJOSteQlpRTUR3Cz74YUjyqsVnPTZlx4Pvzr6KKrv7h4grRW6uoDr/
 IEpUVW0+5ejGtly2M5gZbox92yK0d8KZMwV3z+AH07bNdwK7ShiHBjleHzHptbob/Sml
 JCREVGHwdBHqbQoAg/YRpns67fyjWfUuTuY02W4fA+IxrfTnuFccaHGStlEkWsWyKrqT
 mNV+EsrzJlJnSBh3rjY/mjXIhQO2mbSBLAmbJ6+BPuE389n/p+Z+ARIfaDdYoL5cv1N+
 N98g==
X-Gm-Message-State: ACgBeo3zdx7V4pfuoXH18UvI/d8Q8otb8hABsAKdwCQ0wY0Wg5b+s+yk
 wo+58e1ve95GcIvdLho8fKrj19bzdP7qM/rF1hl8Tw==
X-Google-Smtp-Source: AA6agR6iap0MN/Haqq5fkMqBxMdghMU0kOU8P9vQjtc0c2zQRfYRLOyJ3/sCxZqM/cLm9XXjx7J1+vlWEYgDIJsK/6c=
X-Received: by 2002:a05:6214:f6c:b0:476:6e82:7af4 with SMTP id
 iy12-20020a0562140f6c00b004766e827af4mr20709675qvb.129.1660710892981; Tue, 16
 Aug 2022 21:34:52 -0700 (PDT)
MIME-Version: 1.0
References: <reply-7437a5432d1d1dd66e01a873476af718@gitlab.com>
 <merge_request_127929163@gitlab.com> <note_1053244139@gitlab.com>
 <note_1055213731@gitlab.com> <note_1055338429@gitlab.com>
 <note_1055412158@gitlab.com>
 <note_1056302555@gitlab.com> <note_1056303456@gitlab.com>
 <note_1056304663@gitlab.com>
 <CAHA-KoMZ+mqdVfzAAWZwuDiLjRtFQr_2wjCSrYnq_fbt2RukAg@mail.gmail.com>
 <CAHA-KoMbp=nyMa2vDeFy5VBJpBtjNYzLetUWTSi-kWkbd5RBgQ@mail.gmail.com>
In-Reply-To: <CAHA-KoMbp=nyMa2vDeFy5VBJpBtjNYzLetUWTSi-kWkbd5RBgQ@mail.gmail.com>
Date: Wed, 17 Aug 2022 16:34:41 +1200
Message-ID: <CAHA-KoN=EbO_fs5XCsAn4K28JhO-0i5by52_cEoa_cHdrnXV9Q@mail.gmail.com>
Subject: Re: Samba | DNS updates allow/deny for SAMBA_INTERAL dns server.
 (!2271)
To: "The Samba Team / Samba"
 <incoming+7437a5432d1d1dd66e01a873476af718@incoming.gitlab.com>, 
 samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Matt Grant via samba-technical <samba-technical@lists.samba.org>
Reply-To: Matt Grant <matt@mattgrant.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Joseph and Douglas!

Should be ready for merge, if there are no further issues.  As below, have
corrected formatting issues.  Please let me know how you go.

Have been through ALL the code and reformatted it, fixed over length lines
past 80 chars that should not be overlength, and fixed functions in if
statements etc as per README.Coding.md

BTW, could you please rerun the fuzzing check on dns_update_get_caddr() in
source4/dns_server/dns_update.c.

There was a return WERR_OK that should have been return WERR_CONTINUE in
the default: part of the switch statement on update->rr_type that was
causing the NULL values in *caddrptr with WERR_OK that you found Douglas.

BTW, does lib/util/access.c have any test suite coverage for the
allow_access*() functions? Looks like it's pretty ancient, pre unit testing
and I can't find any tests...  The stuff I have done for the
dns-updates-allow-deny tests may be the ONLY code that exercises it?

Thank you for all your help,

Matt Grant

On Thu, 11 Aug 2022 at 22:48, Matt Grant <matt@mattgrant.net.nz> wrote:

> Hi Douglas!
>
> Have included the fuzzer commit you wrote into the merge request, added
> tag that it was Written-by: Douglas Bagnall <
> douglas.bagnall@catalyst.net.nz>
>
> Could you please check that the fuzzer works.  Think I have fixed the
> problem line in dns_updates_get_caddr() to return WERR_CONTINUE instead o=
f
> WERR_OK.
>
> Thank you for all your help!
>
> Best Regards,
>
> Matt Grant
>
> On Thu, 11 Aug 2022 at 22:00, Matt Grant <matt@mattgrant.net.nz> wrote:
>
>> Hi Douglas!
>> Could you please show me how to include the fuzzer for
>> dns_updates_get_caddr you wrote in the tests for the dns-updates-allow-d=
eny
>> merge?  I would like to include it so that people won't have too many
>> questions when auditing that code, as it does serve a useful purpose
>> turning a PTR domain lookup into an address for the dns updates rrnet
>> allow/deny filter.
>> Thank you!
>> Matt Grant
>>
>> On Wed, 10 Aug 2022 at 12:37, Douglas Bagnall (@douglasbagnall) <
>> gitlab@mg.gitlab.com> wrote:
>>
>>> Douglas Bagnall <https://gitlab.com/douglasbagnall> commented on a
>>> discussion
>>> <https://gitlab.com/samba-team/samba/-/merge_requests/2271#note_1056304=
663>:
>>>
>>>
>>> The prototype fuzzer I mentioned is in
>>>
>>>
>>> https://gitlab.com/samba-team/devel/samba/-/commits/douglas-grantma-dns=
-updates-allow-deny-tests
>>>
>>> =E2=80=94
>>> Reply to this email directly or view it on GitLab
>>> <https://gitlab.com/samba-team/samba/-/merge_requests/2271#note_1056304=
663>.
>>>
>>> You're receiving this email because of your account on gitlab.com.
>>> Unsubscribe
>>> <https://gitlab.com/-/sent_notifications/7437a5432d1d1dd66e01a873476af7=
18/unsubscribe>
>>> from this thread =C2=B7 Manage all notifications
>>> <https://gitlab.com/-/profile/notifications> =C2=B7 Help
>>> <https://gitlab.com/help>
>>>
>>
