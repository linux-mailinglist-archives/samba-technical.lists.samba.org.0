Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F06296A51
	for <lists+samba-technical@lfdr.de>; Fri, 23 Oct 2020 09:31:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=WyOL37Lrx6wUah+SAY/9t5ezssVLI3u101ddGNi3FTE=; b=14C+gapRlHKo25nZd+Bc59LA/Q
	X5Y054a8U8G0johjNQaTillrK4xvLAUmupKxziAvg8GiiV5cuhRdfKZmTqyB51CFjDkzN3ca4X441
	moCRyaODEaj5UmRJsRFtaDjiKoEhjQ7P988uoSh/jE//BxqMNIlGpP1c6hxOzbLCFq26CwvPziHxI
	Bcfd6jUxV7hvRHmKFbRDIsGFGVw6mN6SQ/qw0QBhJNqx+pgoGJ5GfP11lVr7UCUZoCwogDEQJpoM5
	uc5o8GCINKYtvv0kyvHpxiYcx+996I1s3SkuFj7bl65JFoaBQTrdGQTg7DjypZZ4Rfp5CrV471+AP
	WgmibTaQ==;
Received: from ip6-localhost ([::1]:56148 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kVrWY-00DQ6c-9x; Fri, 23 Oct 2020 07:30:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61122) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kVrWH-00DQ6V-Om
 for samba-technical@lists.samba.org; Fri, 23 Oct 2020 07:29:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=WyOL37Lrx6wUah+SAY/9t5ezssVLI3u101ddGNi3FTE=; b=pT6n1+rCcVe7ZUjXhjaM9aZmgf
 fhu/nnt8BvyaaRjzwgbElmHak+c9Y8zPMSxn0ybIWmtGTais0hFgYwY9g4in4l299r4QHxAQ5V09g
 QAGhLfZh6w93eifWjdhFUWCOde5r/3MkajttlI+rfUqAvkVsNvXBHeJrZB5N4ctNI4HluC2AAKMrR
 eAA5MEbjUY6qoha4G8jfD89MuKFv4zzhPvhse1KY5vsh44HzQCvHzQxk8tJMoem8bT3PQpUVd4EQ3
 ytEZ5YH8YwFyI1xHBx81FRuzkqLMK61oST9bZkvVAGKk6hNKXK2lksIbLIBUThlxqbf3JO+ALLCU1
 4+N1NyQWWeW+a6r5pJtLqYgJ05B4+nO6u51XB1AbFBQDlHZ9iWc7cZDOZimg7qBdVAVz0LIK4W3w+
 DuwWmgjwo9cpg6QJwxlVfkoKbynXPwQ7bCFr1oqYs/msVJzCmJuYTr4mdNtC2ZpYlYsMmqLTOKIr4
 j5LanP8MuN6u0LuGxGmOOtjy;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kVrWF-0005B4-HC; Fri, 23 Oct 2020 07:29:48 +0000
Message-ID: <0e867e3182121c8a86c4a4df156d04226cd0c00e.camel@samba.org>
Subject: Re: Samba coverage on oss-fuzz (was: Re: fuzzers)
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
Date: Fri, 23 Oct 2020 20:29:40 +1300
In-Reply-To: <84c81689a51aee7beefdb415393b55627f3c8d21.camel@samba.org>
References: <2546695.cijFyKqbAK@magrathea> <2725858.Fi8pKjZunP@magrathea>
 <4725118760e5c24f70cf6d9c4751ad565a398792.camel@samba.org>
 <84c81689a51aee7beefdb415393b55627f3c8d21.camel@samba.org>
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

On Fri, 2020-02-07 at 11:35 +1300, Andrew Bartlett via samba-technical
wrote:
> 
> I looked into this some more, and the build seems to be working on
> the
> 
> Samba side, but the issue is that because we supply no fuzz seeds at
> 
> all, we fail the test because they don't get run.
> 
> 
> 
> Once we add some seeds things should get better.

We added seeds, but the issue was that we didn't supply the coverage
flags as linker flags.

We now, finally have a working coverage build, with output here:

https://oss-fuzz.com/coverage-report/job/libfuzzer_asan_samba/latest

To improve that, please add:
 * better seeds to https://gitlab.com/samba-team/samba-fuzz-seeds/
 * better fuzzers to our build (eg more targeted)
 * improvements our code to not have impossible-to-meet branches

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




