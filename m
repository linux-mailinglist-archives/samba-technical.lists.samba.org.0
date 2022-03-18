Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 972474DD7A6
	for <lists+samba-technical@lfdr.de>; Fri, 18 Mar 2022 11:08:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=svknVSuDavI6WUiNrrSTPEwiT/sLmHjPu7T1bdg8ejg=; b=LbTlzgKO4JC2HY6hlcKU//2OX9
	ryZbOM//JXJYlxm86D+ac5ok7a2a9uVt0jCw+C48ZTEtI04zSTWBg9ibbXALl1FJlTbc3i91ks+ms
	lzgIlUx3t6ESm6lU/zCIjzuJKSj/+GoAPxqMni6ZIGH8kMSUAnExvtz/U3d14TDlkmgo/anFJj8g1
	0VpITD2dbLQ3q+/xVgVkxmrmvLqWlTvxpgXjNUyyRIMT8N/ALvpb3CZLU/G9nuYg8WJlJFaJXxsB2
	plRcKQmnGaKi+hSXEU6g8EIm1b9TqxQT+z09wka7/f+QNX7uuK4wkLhY3wbFZ++LnVGcMxfoPMS0M
	G5Audcbw==;
Received: from ip6-localhost ([::1]:56890 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nV9WG-003SKv-1B; Fri, 18 Mar 2022 10:07:40 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:40904) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nV9W4-003SKl-4F
 for samba-technical@lists.samba.org; Fri, 18 Mar 2022 10:07:36 +0000
Received: by mail-il1-x12c.google.com with SMTP id h21so5494047ila.7
 for <samba-technical@lists.samba.org>; Fri, 18 Mar 2022 03:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yChkh73Sx/XdVnSNYuENCREQEmz/y5lc9g7z9Z+uCyQ=;
 b=GOM+R4HyYseznjXUFGELdKFMbpPjaG0CnPOd7jenfzYROpjfOYuGyDyq09Vph6Z1h1
 PT2EAoWf0SPTHOE+HoJPZCJsb8CMOObeV7ZxaTDw0qaPN0KpK7IEpVyRJ78beZurDOk9
 /pnzDVYOgYHixJppIc7L5tJkq3Wboa0j5bdxgBaLMMcKEtG7xk5SBhuHVV63KGSgvT/M
 Yw9bmO1n1Z5anaH19lIAGF/gJmnGIlaoLZRMG0QmM2X5R9V+r7eAnWX55pPN78lUiO3O
 s5IBMsjodfAe9YygtvOcwb5Bu2dpVE8A6NQSqYErWAmD/FU0oTtINZH4NoOKFVV3EjOs
 S0SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yChkh73Sx/XdVnSNYuENCREQEmz/y5lc9g7z9Z+uCyQ=;
 b=Bw57S/spLN8T3lZbV/u+/OCEVQOsvFt/z3uPGIDT+pEM/MZWUlfNkM32QZO58I0JAF
 i+VWB8AI8Fu69BI2h9AI7ZW3jLMUMfiWuCsaXChRGVFLT3uR5NljxdGOou6HW7s3B27F
 VA1l3HUneM8hF99AHxXIQHnAoRZKbHtboQu99JxSUQllDftJM6Qula+ELJ3Jx2+4u9mK
 02w9LB3iKSpZR7m8QEqlplvdLFHkaIJ0Q9BaFoIR2VlmZskdqACbJfYbSvDLDdUkY0Y5
 mE3hYBN0wZ2oPwdEDEfX7G05YU9nMsnJdUOKkKT9hIJD8KdTT2rb4BUaG3oW85qdoC8W
 F6jA==
X-Gm-Message-State: AOAM532ONge/gb4zJ9Ni3xksgkO3KnD0B1GRiJNU/viRJdReSnm5q5fQ
 LlpP1a1wv0RSEJa7n0gNPn4hBMm1ugaWQrCalmoDxWlOUOs=
X-Google-Smtp-Source: ABdhPJwDuFzoHRQCNFO+38dIM9TuIuysDAYVQZ3N5yqP83J7ahMSn219H7DH4EnSNZ9N1xVX95QLxcUZvfgHT0L3uEY=
X-Received: by 2002:a05:6e02:1a4f:b0:2c6:6499:9d1b with SMTP id
 u15-20020a056e021a4f00b002c664999d1bmr4050038ilv.119.1647598045231; Fri, 18
 Mar 2022 03:07:25 -0700 (PDT)
MIME-Version: 1.0
References: <e0c3b5921e018a5b74448f40a26af4015193824c.camel@samba.org>
In-Reply-To: <e0c3b5921e018a5b74448f40a26af4015193824c.camel@samba.org>
Date: Fri, 18 Mar 2022 12:07:14 +0200
Message-ID: <CAH9M6r+uJ8VPTdHy_=094QXOqQaf63DpfN9H0k0kUaKfUk5ajA@mail.gmail.com>
Subject: Re: We need to rework FIPS mode in Samba
To: Andrew Bartlett <abartlet@samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Aleksandar Kostadinov via samba-technical
 <samba-technical@lists.samba.org>
Reply-To: Aleksandar Kostadinov <akostadinov@gmail.com>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

How can samba be FIPS compliant on a non-FIPS compliant operating system?
Might be easier to just run the tests in a FIPS compliant environment.

On Fri, Mar 18, 2022 at 2:40 AM Andrew Bartlett via samba-technical <
samba-technical@lists.samba.org> wrote:

> I was hoping to hook onto Samba's FIPS mode for my 'no NT hash' mode,
> but I've done some testing.  Despite the GNUTLS_FORCE_FIPS_MODE being
> available in GnuTLS since version 3.4.0 per their git history, it isn't
> available on Ubuntu 20.04.
>
> I'm assuming that is because it isn't compiled with FIPS-140 mode.
>
> We need a mode in samba, controlled from smb.conf, to disable weak
> cryptography and other similar things, and flip things the other way
> around.
>
> We should check lpcfg_weak_crypto() before doing any 'weak' crypto,
> including things not implemented with GnuTLS (eg our mdfour()
> function), rather than asking GnuTLS if it will allow weak
> cryptography.
>
> I don't mind if it defaults to auto, which in turn defaults to the
> FIPS-140 mode from GnuTLS, but we can't have fundamental Samba security
> modes depending on the compile options of a system library.
>
> I do find it curious that we don't have any tests that noticed that
> setting GNUTLS_FORCE_FIPS_MODE actually does nothing on our main test
> platform.  While GitLab CI is great, we can't safely implement more
> security strengthening features if the tests of them can't run in
> autobuild on sn-devel, as that is where stable branches are tested.
>
> I would note that we are, particularly if we can move to a 'secure by
> default' approach really close to passing things like the OpenSSF
> (previously Core Infrastructure Initiative) best practices badge.
>
> https://bestpractices.coreinfrastructure.org/en/projects/200
>
> We are actually really close on that - perhaps we would pass if
> we disabled the LSA QuerySecret API.
>
> Andrew Bartlett
> --
> Andrew Bartlett (he/him)       https://samba.org/~abartlet/
> Samba Team Member (since 2001) https://samba.org
> Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba
>
> Samba Development and Support, Catalyst IT - Expert Open Source
> Solutions
>
>
>
