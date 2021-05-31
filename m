Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFEC39539D
	for <lists+samba-technical@lfdr.de>; Mon, 31 May 2021 03:15:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=HID3yP8RFAFqiXCzQPO9eWCDtX0wNNdf+9uBJunqX8M=; b=fYMvk4apRcOqJt5UkC5g0S1q5T
	pPUAwO02ChAVNSccZzeSiuvoJBApW9AiQ4v+uJ+cldYfpJjb0ipceWcd+iS5gRY/6XnIq8WDz+4HZ
	FTjr4R34LtwOfJgPq04ZelkAyPDWXtqdB8QFctocYSmaIbDDDauO3jk/jqhDkqdWgMdieOKrauH6V
	XKEeKdocUyGpkR3n6i5d02/Y2C7iiTbtlJ5Ag9fa3EJUn6H3lMutR51QjqKlOF/6sdYniCZ2JAlwf
	NSUAkGj757AR0tU0juzbPG0LLDok84eUVqXy9yBJfTfWM0Ao4zkJ90hRPVvmT5oPzBr69SfAwEbd9
	L9HLGqbw==;
Received: from ip6-localhost ([::1]:43348 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lnWVy-0001Z0-8z; Mon, 31 May 2021 01:14:46 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:38859) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lnWVr-0001Yr-4W
 for samba-technical@lists.samba.org; Mon, 31 May 2021 01:14:42 +0000
Received: by mail-ed1-x530.google.com with SMTP id o5so11600126edc.5
 for <samba-technical@lists.samba.org>; Sun, 30 May 2021 18:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uUNhy5yB8GgUMMT0ffkXMvhhBq6KzjVVR4WsU6iwAHQ=;
 b=Isqrpd4iJ1/i+My8vih3tkGWM0NANz1KqlLJ7XzTL7nCORd3m+AFt3vo3xaxh6Fud3
 9Ro8N3F4UPAjTNViXW9g+xKGU1XjCLF/uhIgx3uoJBjJQxQUv6Nj8BCEQXAhNb+EndUY
 l2CWVBJYQnlMZnJP7ccc72O8zxKS6Udclc/JuZTty12N/UpsRNPR89fX3lpCtGgItA1K
 rxkt6wXiCde0Ozlc31NC7g4toagljqxVheTcAzfnvax9MhD5UjBTNtglc353wxiGdK3t
 9XLlebNvpZlfE/9pUe8hVZKsFHK5KdZdlsuQ41t5WCdSr6909wdb31VY4JDq4vxkG2uy
 eJIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uUNhy5yB8GgUMMT0ffkXMvhhBq6KzjVVR4WsU6iwAHQ=;
 b=rYsERvOZunSBK8NYcZj1AB4IXY3XHUTI2V3m2qHhtQkG3WONKHWYNaqKpjpYGEOwRO
 mkHJdxYGuqmpnUBMNW4kSUndaohEaMEhGzNSVmW9744EojShQ0pyhtRAvcS7bLzZi7Vn
 6QpOPyOC4yUuqit/R4E6qiRd6ABj6DkYc1rGARFm3bc46lKiUVFpm0cwN6qV2EPjPA4X
 aJy3u47L77c91HIjSd7Vwu3mH4UPtV95X9jUZRxTMMDa5X7Oq4CvrlQ4TjCzVjdsSn/t
 72oSsVJ/HO6I3I0za4GWlh0o3zEm4bBya1587OV6Ij48yM37pfvBH5wSdFlzPEXl4SlE
 2Wsw==
X-Gm-Message-State: AOAM531WYS7gACyD9cYxEvlHalozbL0XjWi2fi/xjpArilpI9LYCKSC8
 YXl7yhu7tQK8/8ah8/u6pC5QM5g+8BlW0R9vii+UrQ==
X-Google-Smtp-Source: ABdhPJxSKtAQiX9HzMKhfa2s/4rQ20L8a55zsBx91f3N7K3V50a2eexIjcbGbCwnhar2TLppLuZfPMiip2/a2feDIl4=
X-Received: by 2002:a05:6402:95d:: with SMTP id
 h29mr22490842edz.233.1622423673819; 
 Sun, 30 May 2021 18:14:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAB5c7xqUC9mZ8-VFDmM44b=EL49yBiWkMikf8BWgU0FjC+25MA@mail.gmail.com>
 <562c85d7-c1d8-c978-6136-3ca538d12857@samba.org>
In-Reply-To: <562c85d7-c1d8-c978-6136-3ca538d12857@samba.org>
Date: Sun, 30 May 2021 21:14:22 -0400
Message-ID: <CAB5c7xqZ3OAB4YJDsU5tj9GAh+j4KiYUz_5wwOG1xeAkFcFH9g@mail.gmail.com>
Subject: Re: JSON input / output for CLI utilities
To: Ralph Boehme <slow@samba.org>
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

On Fri, May 28, 2021 at 11:15 AM Ralph Boehme <slow@samba.org> wrote:

> Am 27.05.21 um 23:42 schrieb Andrew Walker via samba-technical:
> > I know we've added JSON output to a few of the CLI utils. Over the past
> > year or so I've added this to various utils in FreeNAS (using
> libjansson).
> > Is there an overall strategy for this? I'd be happy to upstream what I
> have.
>
> I guess as what you have worked for FreeNAS/TrueNAS and unless it's
> somehow tailored to specific usecases, it should be good as is. :)
>
> > Also is there an effort to add support for JSON input to them?
>
> Not that I know of, but that sounds like a nice addition for some tools.
> For which tools do you have JSON input support?
>

I'm in the process of adding support for pdbedit, net groupmap, and net
conf. I see one of major advantages of JSON input support for some of these
is we can trivially add support for batch operations. Libjansson is quite
easy to work with for doing json input via json_loads().

Example:
root@debian:/CODE/samba# bin/default/source3/utils/net --json groupmap
batch_json data='{"DEL": [{"nt_name": "acltester"}, {"nt_name":
"scanner"}]}'
{"version": {"major": 1, "minor": 0}, "groupmap": [{"nt_name": "awalker",
"sid": "S-1-5-21-1908376751-3950050175-4123529826-1004", "gid": 1000,
"group_type_int": 2}]}

root@debian:/CODE/samba# bin/default/source3/utils/net --json groupmap
batch_json data='{"ADD": [{"nt_name": "acltester", "gid": 1001},
{"nt_name": "scanner", "gid": 114}]}'
{"version": {"major": 1, "minor": 0}, "groupmap": [{"nt_name": "acltester",
"sid": "S-1-5-21-1908376751-3950050175-4123529826-1009", "gid": 1001,
"group_type_int": 2}, {"nt_name": "scanner", "sid":
"S-1-5-21-1908376751-3950050175-4123529826-1010", "gid": 114,
"group_type_int": 2}, {"nt_name": "awalker", "sid":
"S-1-5-21-1908376751-3950050175-4123529826-1004", "gid": 1000,
"group_type_int": 2}]}

(note above batch command gives net_groupmap_list() output after completion)

So in this case, I can submit `{"ADD": [{<groupmap 3>}, {<groupmap 4>},
{<groupmap 5>}], "MOD": [{<groupmap 2>}], "DEL": [{<groupmap 1>}]}` and
make all the requested changes in a single command.
