Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2567A4F1338
	for <lists+samba-technical@lfdr.de>; Mon,  4 Apr 2022 12:37:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=+YhSEvqA/d/QF14I9CInuvvk3whyBTdUQ8B3waD8ZeA=; b=42WyfRP0Q13mcDw9OKTqzAR8cq
	VVzhKCIFozGoTF6gvcC1krAJH8J6573IyazXIli3ot8lmELBavwxnoXXrhF7ZZVgt98iuGGl1wY2r
	uB/ssw2HjacrfuWB4qcurBXqkZSrbc+I0n30hmqm/Bx4iKbQ98964BforVxc/+9Dv/hihD85qfl6b
	1yb0lvd2YsvttR89WeJ8Ba1MHvh5mvkN/rRvc0pYLBcT4s0WKeu9JEJD2BdSAppoAumO/0xwd3ccV
	W3mUAHPFUIeXOLbAQuUsjryxX73N8ZWVzhX0Fkdp6cKSSnXwXwWSuGsUOvL647HEa9I5qQXtD1k1/
	scLgAIMQ==;
Received: from ip6-localhost ([::1]:32382 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nbK5I-009mEe-W6; Mon, 04 Apr 2022 10:37:21 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:36465) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nbK5B-009mES-4t; Mon, 04 Apr 2022 10:37:16 +0000
Received: by mail-io1-xd33.google.com with SMTP id b16so10686397ioz.3;
 Mon, 04 Apr 2022 03:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kiG8kUqzhFJd4PR/JdO+5uGnVSSuODVe2CqXnSvgJbM=;
 b=oXDJNYAsZE4WLwkIFPx73ptLTsvbAXQYOYvMDx+ainFc5UAeg9xfBU5dX+hOQlqFpV
 IUaZ15cKGONChTV72cpARjw/yQTs/muATCQi3jsEXI58OMjq7Gi0f7uM44SOiM/rlzfE
 NL2a6zlVV+H10U26YCmWFBxqgtF3f1Zeg39IOpwG3i84XOUYVHOoYPvcuwcfQfXX49CY
 9KQ4yMOWJSIYSNDUmhgDKwC2cAuJYIM6mUNrtLi8TNwWnN1rEb0Q/FHjRQHxFhWe8368
 +0DqUhaiI1tRGV+yL3oGhscPv5Y5VU2z0WHy/B2qGdpNys03j5SHnGWCN5i+UqQ8i5bL
 Q++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kiG8kUqzhFJd4PR/JdO+5uGnVSSuODVe2CqXnSvgJbM=;
 b=TXAsh2My01FhQDcoCCjcRrGnrg+hrkuXQXABubooq+X8wfuOVf6wOoHzEcD9wQQVKp
 NIlqhxvLM+n9yOlpj6MtmPjuROyEhY7Yxe30FlcABTtMjmbqaq5oNHDKpoevR4OcmKgT
 MtYP2o6LHuptcFZEN2sOMkmheD9r8aVGWubL9FFLXRJhjx60NaqWItyrkqRZ8n2PB2SZ
 llBwckjJ58dVjpLLt0er3TMfB3jmriCeqytGcu1w9eDbb6RfYTxc1TQWjHR7iWVmEpCI
 DsmYVaK4Ulo+7SD9zasDcE/fsZ7Pu8zFu35NsSN3ofvadOz+XaW4+byCmRvM1WK1haNR
 Tc3w==
X-Gm-Message-State: AOAM532Ew4w4qBHEiPLFFIO0bp6q5l+F/MvkC3XSs7FUpDsNWtakksaf
 hXVST1Ix24kccQa5w0yj6uoySdxbJVXcxV2qz2c=
X-Google-Smtp-Source: ABdhPJx2UNmR/x4cAz4CQkIWePqNTU4BXX/e6v+71zgOpnjZ/nTa/kphGAkVGI9AtaepLIPWC9lgrvknzbC1951v4PQ=
X-Received: by 2002:a6b:6d0d:0:b0:64c:7a7d:558d with SMTP id
 a13-20020a6b6d0d000000b0064c7a7d558dmr4866429iod.42.1649068630810; Mon, 04
 Apr 2022 03:37:10 -0700 (PDT)
MIME-Version: 1.0
References: <0a610624-79ce-6fa4-bbe7-3612969e5b74@samba.org>
In-Reply-To: <0a610624-79ce-6fa4-bbe7-3612969e5b74@samba.org>
Date: Mon, 4 Apr 2022 13:36:59 +0300
Message-ID: <CAH9M6r+SBJwNphbHQPuRLG=c-wZbEnETPVYogaYwYeKMWBYpdw@mail.gmail.com>
Subject: Re: go IPv6, fade out IPv4
To: "Samba.org Admins" <go-ipv6@samba.org>
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
Cc: samba@lists.samba.org,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

What does it mean "building IP nodes", excuse my ignorance. This is from
RFC 6540.

It seems like Bulgaria is another country where it is rather hard to get
IPv6 support. Depending on the actual location. So I'm trying to understand
the RFC requirements and be able to properly advocate for that.

Thank you.

On Fri, Apr 1, 2022 at 3:09 PM Samba.org Admins via samba-technical <
samba-technical@lists.samba.org> wrote:

> Dear Samba.org list members,
>
> as you might have heard, the pool of IPv4 addresses is exhausted since a
> couple of years already. As a result of that, companies can buy IPv4
> addresses in online auctions and the prices for that are going crazy.
> You can have a look at https://auctions.ipv4.global/prior-sales to see
> the current prices that need to be paid. These days you can get more
> money out of IPv4 address blocks than out of Bitcoin actually. Don't get
> us wrong, we don't recommend either actually.
>
> Also our hosting provider was forced to raise the prices for our IPv4
> addresses considerably and announced that the prices will be raised even
> more in the near future. We're expecting that we'll soon have to pay
> more for the IPv4 addresses than we pay for the server hardware itself.
> For that reason we're planning to get rid of the rising costs of the
> deprecated IPv4 addresses.
>
> We're offering all of our services via IPv6 since many years and we want
> to switch them to IPv6-only in 365 days from now on (2023-04-01) to cut
> the unpredictable costs of IPv4.
>
> Most people already have IPv6. If your provider doesn't offer IPv6 to
> you, you should contact the provider and ask him to enable IPv6 asap.
> You might even ask your money back if you had no IPv6 in the last couple
> of years, because the 10 year old RFC 6540 mandates that IPv6 is a
> must-have for nodes claiming to support IP. In other words, if you don't
> have IPv6, then you don't have internet access.
>
> We created a web site for you to check if you have working IPv6 support:
>
> https://ipv6-test.samba.org
>
> If you see only a sad face, then you have only IPv4 support, if you see
> a sad face covered by a happy face, then you have IPv6, which is good!
>
> Apart from your own internet connection, you should also check that your
> mail provider supports IPv6:
>
> You can *receive* mail if at least one of the MX records of your mail
> address's domain has an IPv6 address assigned.
> https://mxtoolbox.com/MXLookup.aspx can help you to look that up.
>
> For testing if you can *send* mail to IPv6-only mail servers, we've set
> up a test mail domain. If you send a mail to test@ipv6-test.samba.org
> then you should be receiving an immediate mail refuse error while the
> error should contain the text:
>
> 550 You can send mail to an IPv6-only mail server SUCCESSFULLY !
>
> If you got that error, then you can mail to IPv6 domains successfully.
> If you get no error message or if you get any other error message, then
> your mail provider does NOT allow sending to IPv6 domains.
>
> Luckily most mail providers DO support IPv6 these days, but there are
> still some well-known ones which don't. If your mail services depend on
> Yahoo (like yahoo.com), Apple (like me.com, icloud.com, mac.com), gmx,
> web.de, t-online.de, posteo.de, Protonmail, Gandi, Mimecast, Zoho or
> Rackspace hosting, then you will be out-of luck probably.
>
> We believe that providers who still don't support IPv6 in the year 2022,
> have been sleeping at least for 10 years. If your provider is one of the
> sleeping ones, you can try to wake him up (good luck!) to be able to
> keep on using our services after we disabled deprecated IPv4.
>
> If your provider doesn't wake up (quite likely if he slept till now!),
> then we recommend to switch to a provider that does support full
> internet access, which includes IPv6 of course.
>
> In case you lack IPv6 in your corporate network, then ask yourself if
> you acknowledged the work of the networking team enough in the past. Buy
> them a coffee or a bottle of wine when asking them kindly to enable IPv6.
>
> We are aware that in *very* rare cases someone might live in a country
> like Greenland, where it's not possible to find a provider with IPv6
> support. In cases like that the friendly guys from HE still give you a
> possibility to use IPv6, see http://tunnelbroker.net/
>
> Side note: Also github still doesn't support IPv6 and doesn't show any
> sign to improve this
> (https://github.community/t/github-com-not-reachable-via-ipv6/216624) -
> samba.org switched to gitlab, which DOES support IPv6. We think that
> nobody should deal with service providers that don't support IPv6 these
> days.
>
> Please don't discuss this further here on the list (we'll ignore any
> list replies); but you can send any feedback (both positive and
> negative) to go-ipv6@samba.org. We'll consider your feedback for our
> future plans.
>
> Your Samba Admins
>
>
