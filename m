Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 888883944D5
	for <lists+samba-technical@lfdr.de>; Fri, 28 May 2021 17:11:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Lhyr5GxgRuwClVIdqwp3CSViQ/7AhYh+jOnm5grwrXU=; b=lf1sjDKMjT8+vavGhKbIgivu/D
	ZFFIy7iOY+XFEXrnVZ8zVLMJJhV1zLCKumEIGTb/lptzZ0E09pGwEwajbRkABnVcPKZeeZ+eKfP9n
	QkbqWNIdylDUm3LAki81JOtlHzOEiTPLWZsTfuT8jKrt9lCvnJQm7qU1YcNzf583rglKVzq6BEM0C
	yMQyQ/w+ZImuIXrT99oR+Tmj1z1HuF1B+bvCTBlmuZAb0uLB72yUr63umQo+jsxdzgD0rM911uchV
	04121CIVOVMIXPElTlr5ljLdhbKnLJVERgapcWyUz9qrFjeoTWQKn5jt7o4l3sswupjjXxaDT9qvR
	3bvljwIg==;
Received: from ip6-localhost ([::1]:61074 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lme80-0056QL-AW; Fri, 28 May 2021 15:10:24 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:43756) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lme7r-0056QC-BF
 for samba-technical@lists.samba.org; Fri, 28 May 2021 15:10:20 +0000
Received: by mail-ed1-x531.google.com with SMTP id s6so5196987edu.10
 for <samba-technical@lists.samba.org>; Fri, 28 May 2021 08:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e5ibYFY0XneOHwKb5ktHNkPn0s/QXpsjEAvICmFxEII=;
 b=BMH11sSoYZkAzBQaDqq+NmHX9srxcB9ltI6ohcAYKCJ2FA5XeIbxM+9uFE/TDPzacr
 wH3Xult573eHlvzGb3pScEHfzJhNx2XpRYchB0ElxUinCZUTZzX+kULYtK+lndIwT7k/
 GVzDhAiyvgsJ/ouiXHAafPXs7xhANxvva7pLQ/mmlKvjLePJcbclTDUFIvhoZzeO8orQ
 tA/0MRu9zPDJtvrNCWdQKbXPLJE5WbeaLrLMcmUX6Ijx4IMLqRgBsbH1M0wO0LaVPl2s
 pisMpw1DH2QaAf2zwC+3p/tH14HD1gTc8rvk+dffbYtxfmD6VIUBsg5OV0aolTTj5Om/
 sMGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e5ibYFY0XneOHwKb5ktHNkPn0s/QXpsjEAvICmFxEII=;
 b=kJvYoP9KlOEZJXBBLwjZR+fYvoxqt3yznxf08vLLSwVDKH+iFrGBhhWwwDacAJT5wI
 rdJlmwecSZONS7POMlWBy0BCzfwxMsqz1SoYQAwWXkO7PGiMKTL22VW1/MPyeW87HM0L
 Eq3Q8OILCcJKeNWIai7WX8bw+39oJSby3NQxS+vnjRlhEoQ0cqNjZ0/KJ6PGt0u1F2d5
 Iqt8L6jVel1aAKc55tk7zHCKKW5A3K9zQmCKr2UkELJA2JfrcyV8kiwxn7sADeeSuy85
 zW6SA5mmLKGw/CG/KI8+HgGgnUcvScuAZJrwaWzyww+BCaz7h/0lo06iqy90A/QnaHHm
 VWtQ==
X-Gm-Message-State: AOAM532JALANx1XC1N8v7A8DCwGxK++38ihR8QUpI7dFkXlQdmmx5gfn
 XlGIzFv8oPHbCqSpiCQBV+Q1dgPwg190jzn2yDN88w==
X-Google-Smtp-Source: ABdhPJxXkBXH322S0HGmrHloMa39wXdCMwGy4J+jfm5ETGu3LnjdjOMbsSH1vpL8cix+q+/5D8/nKg/dG2tuJB/s94E=
X-Received: by 2002:a05:6402:1686:: with SMTP id
 a6mr10428017edv.123.1622214613575; 
 Fri, 28 May 2021 08:10:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAB5c7xqUC9mZ8-VFDmM44b=EL49yBiWkMikf8BWgU0FjC+25MA@mail.gmail.com>
 <cf23d39b-a13b-a9fb-64b1-e5094a4336e5@catalyst.net.nz>
In-Reply-To: <cf23d39b-a13b-a9fb-64b1-e5094a4336e5@catalyst.net.nz>
Date: Fri, 28 May 2021 11:10:02 -0400
Message-ID: <CAB5c7xqp3uEaWgFmYr4vtqwN6og-ii-JhizxZZ9qKL3-tkTPyQ@mail.gmail.com>
Subject: Re: JSON input / output for CLI utilities
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, May 27, 2021 at 8:03 PM Douglas Bagnall <
douglas.bagnall@catalyst.net.nz> wrote:

> On 28/05/21 9:42 am, Andrew Walker via samba-technical wrote:
> > I know we've added JSON output to a few of the CLI utils. Over the past
> > year or so I've added this to various utils in FreeNAS (using
> libjansson).
> > Is there an overall strategy for this? I'd be happy to upstream what I
> have.
>
> Yes, please upstream.
>
> I think the strategy is to look around and aim for consistency between
> tools, but don't let the lack of clear conventions stop you.
>
> jansson is the right thing for C; the standard python library is right
> for python.
>
> > Also is there an effort to add support for JSON input to them?
>
> No effort, but I think we would want to where it makes sense.
>
> Douglas
>

Should we have version strings for all the JSON output generated by
utilities?

 root@:/usr/ports/net/samba # net --json groupmap list -v | jq
{
  "version": {
    "major": 1,
    "minor": 0
  },
  "groupmap": [
    {
      "nt_name": "Guests",
      "sid": "S-1-5-32-546",
      "gid": 90000016,
      "group_type_int": 4,
      "group": "BUILTIN\\guests",
      "group_type_str": "Local Group"
    },
    {
      "nt_name": "Administrators",
      "sid": "S-1-5-32-544",
      "gid": 90000014,
      "group_type_int": 4,
      "group": "BUILTIN\\administrators",
      "group_type_str": "Local Group"
    },
    {
      "nt_name": "Users",
      "sid": "S-1-5-32-545",
      "gid": 90000015,
      "group_type_int": 4,
      "group": "BUILTIN\\users",
      "group_type_str": "Local Group"
    }
  ]
}
