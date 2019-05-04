Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id BED1213688
	for <lists+samba-technical@lfdr.de>; Sat,  4 May 2019 02:21:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=5/eQORN2hnQwdk2LYkbqwm4RLs8w3PBt6jWNrOYaV5w=; b=EiKfVzeZ+kpXnvfko4tsro1UW6
	bL9liOj/6xDOyDe6fHunfV1Z1QfP8ZMMdyGlg0ecoC9efuxoxEdfDYGXwk2cNdHMNVAskTQkGsSA9
	9cuX4cvrrYIw63R5hr1RzWXl4ZR2w00kCUxSaal7QYxTKrAaKinSWkmY2CIRw0LvemgVibZg3Dcm+
	a/DbwSlrKQAaqISioouG9nKN+5ICVfMfK3fkQZwBgCdmraG2b5aAlEe1xc6QesUzBabOSo3xHGuRo
	MdoDAZ/J/5vlBoCbMUuyKWqFwxZOdlqqzTtyJxLtl2Eia6sUlxJx+9Rfc/XOPw1nAUbZv6wXphNVt
	9HtAO/iQ==;
Received: from localhost ([::1]:36784 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hMiQA-002KR8-4q; Sat, 04 May 2019 00:20:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:31210) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hMiQ5-002KR1-84
 for samba-technical@lists.samba.org; Sat, 04 May 2019 00:20:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=5/eQORN2hnQwdk2LYkbqwm4RLs8w3PBt6jWNrOYaV5w=; b=YeV0OTVmV8ittS35OQeI/E8lv8
 UW1iTajXulH3dOALlyxU3a0ht1FyLP9pj5mZEjwK306e/HN7kVpovDMyTAwziURwhd7kBfJyKohAX
 IuZ0UUl5OEpkxtXQrLkH54TNhaWbuPRvVsamzehGH9WzHV+eybyB63ZhTtVpaSAkRLaE=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hMiQ3-000603-Dk; Sat, 04 May 2019 00:20:48 +0000
Message-ID: <965eff00224772d33957ef7fc0f63d414684f094.camel@samba.org>
Subject: Re: getting centos7 into bootstrap and gitlab CI
To: Christof Schmitt <cs@samba.org>
Date: Sat, 04 May 2019 12:20:43 +1200
In-Reply-To: <20190503233653.GA12691@samba.org>
References: <20190429193555.GA28948@samba.org>
 <2134250.fEHozF1qz7@magrathea.fritz.box>
 <20190430145845.6fcfb681@devstation.samdom.example.com>
 <3513637.hkN0grMHb1@magrathea.fritz.box>
 <1556649942.21278.15.camel@samba.org> <20190430230454.GA22132@samba.org>
 <1556674596.25595.100.camel@samba.org> <20190503233653.GA12691@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
Cc: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org,
 Joe Guo <joeg@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2019-05-03 at 16:36 -0700, Christof Schmitt via samba-technical 
wrote:

> 
> I tried to fixup the patches from Andreas to use Python 3.6 in CentOS7
> and force the new image build:
> https://gitlab.com/samba-team/devel/samba/pipelines/59674602
> 
> The centos7 image build seems to succeed, but then the centos7-samba-o3
> build does not start and only has:
> 
> ERROR: Preparation failed: invalid reference format (executor_docker.go:168:0s)
> Will be retried in 3s ...
> ERROR: Job failed (system failure): invalid reference format (executor_docker.go:168:0s)
> 
> Does that mean there is something wrong with the image or the tag?

Looks like an issue at the runner level.  Joe enabled 'shared' jobs to
run against Samba-team controlled rackspace runners as the shared
runners were not picking up jobs fast enough.  

Also, rebase on master to fix the other issue with the 'private' tagged
jobs. 

In terms of debugging for joe, I see this:

https://storage.googleapis.com/gitlab-gprd-artifacts/d7/74/d774f54988aa2cb1f213a2c33407ff6a6b6e5e8de9a78fa29204f25918db3517/2019_05_03/206967360/213521002/job.log?response-content-type=text%2Fplain%3B%20charset%3Dutf-8&response-content-disposition=inline&GoogleAccessId=gitlab-object-storage-prd@gitlab-production.iam.gserviceaccount.com&Signature=cIWqiX892eATRknDYxIV%2BOzbmOzb%2Bn7SZRfZeZnAKAHqNJGPcjxwf%2FdxTd4j%0AyD%2BVV3DPjDQGZ0zSzskyeEBRiZX4nG22q%2FdhGseltNxB9%2FJoC%2FScNVFB818%2F%0AGq%2B5E4L8Ricqyty3ahDQImPaHO8FbxKPG25tYW3g%2B1TXSbndCgwO%2BjsSH54d%0AyNiQXxZD9mKL0aRlCEB2rDN9jTkiDFBQJskgVWSX8MH2t0QmudPWEF0QUeXI%0A1ZRVaRSRHG0UbF%2FYDLB%2BqTErsghz4GHMP02z3nJD%2BLHnWyrU0V6VFtHX0788%0AY2XKYGFD4%2BNztCTXAOrvXOn83OyMkbYfNFuwOurkRg%3D%3D&Expires=1556929456

vs this

https://storage.googleapis.com/gitlab-gprd-artifacts/d7/74/d774f54988aa2cb1f213a2c33407ff6a6b6e5e8de9a78fa29204f25918db3517/2019_05_04/206990567/213537195/job.log?response-content-type=text%2Fplain%3B%20charset%3Dutf-8&response-content-disposition=inline&GoogleAccessId=gitlab-object-storage-prd@gitlab-production.iam.gserviceaccount.com&Signature=nGDeofBvgXrvVxv%2B5pvnxffAKuAy%2B2J2NkV2F8%2BGm5FWXrjgZnkUR6pQ2%2FwF%0A80aKRfyqLnln9K2bFqhsyZbsrjRzHOXsOPqnEFgJMqKjRwGBSCVXmxa2oXAm%0A9pG0ULehp1y2IUykUlBDmeSGazbJNxFG3yHTpoQZnE52KEGkndguU8CS683m%0AAdIsVSarx%2Bk1AhjoF2wRMlhEz3ny6Uwiy12LVnE2Bf7FmIytNslkBzXkfuzw%0AYhzcDj9K8AmxarCSlw2NoO8%2FUbmQmjX%2BOAx81eoYN0HAyggZOxTBdNKstUB8%0AwhZrkZC2A8fZUatva%2BxOwezoWTlh51mRSgX4e0W3Qg%3D%3D&Expires=1556929523

I guess another Friday afternoon change gone awry.  (but this time Joe
did test it...). 

In some sense it will go away once gitlab starts picking up 'shared'
jobs for us again.

Andrew Bartlett

-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



