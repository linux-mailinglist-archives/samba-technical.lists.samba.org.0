Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A09E24BFB
	for <lists+samba-technical@lfdr.de>; Tue, 21 May 2019 11:47:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=nK2b8KRbvXsC+2Vh4LjNSuvMKRNEndYZ2EM+7yBlUhM=; b=dpkj13XnYWnGstLUdOXli0YdLo
	KER2SjEHhaIVH5vD9w1gJ9OqbX/RjI8Gwf4Tmd25RgJKaN6XIxTKP6qB74FBtcwvpAZaPhMo0miZK
	hm0Vcq9VGb7CyjuZbrbd5W2cLKmPzGjwkKFmTlIKbxeag/YTbENHn1PhjpX1g+ucfwRZg/ZVsp2RB
	m74Qa/nEa9zjdplQClv4wKWkFRyjkzmLjMtxbj4WHAt3Tyn5if0LVXMBQ0abbCHiXN2rfgigPTxE7
	4dAdbtaMqntRtE/n4dSKEnODUaEicDd/qPv9iKtFauCmSxPhAblZYtJsKrNo1+L4SXjL8yvNDCdDi
	Vcs7lCKg==;
Received: from localhost ([::1]:41882 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hT1N3-000w9k-LT; Tue, 21 May 2019 09:47:45 +0000
Received: from smtp2.provo.novell.com ([137.65.250.81]:35111) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hT1My-000w9d-6N
 for samba-technical@lists.samba.org; Tue, 21 May 2019 09:47:42 +0000
Received: from [192.168.1.10] (prva10-snat226-1.provo.novell.com
 [137.65.226.35])
 by smtp2.provo.novell.com with ESMTP (TLS encrypted);
 Tue, 21 May 2019 03:47:26 -0600
Subject: Re: New csbuild run
To: Martin Schwenke <martin@meltin.net>, Andreas Schneider <asn@samba.org>
References: <1902926.C4UlyRiazf@magrathea.fritz.box>
 <20190521113607.55e693da@martins.ozlabs.org>
Message-ID: <df4e9e89-12cc-e8c2-7905-8dd6c401b31c@suse.com>
Date: Tue, 21 May 2019 10:47:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190521113607.55e693da@martins.ozlabs.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
From: Noel Power via samba-technical <samba-technical@lists.samba.org>
Reply-To: noel.power@suse.com
Cc: Noel Power <nopower@suse.com>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 21/05/2019 02:36, Martin Schwenke via samba-technical wrote:
> Hi Andreas, On Fri, 17 May 2019 16:34:42 +0200, Andreas Schneider via
> samba-technical <samba-technical@lists.samba.org> wrote:
>> I've started a new csbuild run with ctdb included:
>> https://gitlab.com/samba-team/devel/samba/-/jobs/214444970 csbuild
>> normally checks a commit range for added errors. With a force push it
>> will check the last 20 commits. This means it will go back 20
>> commits, compile everything, then checkout what you pushed and
>> compare the diff of the output. If there are newly added errors, it
>> will fail. However it reports a huge amount of problems so that the
>> log exceeds the allowed size of 8MB. However we should try to address
>> the issues it finds to get to a smaller size. I normally try to fix a
>> few of those issues form time to time because it finds a lot of valid
>> once. It will lead to a much better and cleaner codebase in the end!
>> Please help fixing those bugs. 
> How can I run this locally on my laptop? peace & happiness, martin

The way I used it last was to run it in docker,  that way at least as
well you are sure you are on the same page as Andreas with respect to
any error messages etc. (and you know you don't need to set up anything
extra :-)) you can find the details of the docker image you need in the
job output above (there probably is a way to see what images are
available from the gitlab/samba project registry but I don't know how)

docker pull
registry.gitlab.com/samba-team/devel/samba/samba-ci-fedora29:b4dc3f0b446dbdc20779ae2090de0f5c0da9caef

docker images # which should show something like

REPOSITORY TAG IMAGE ID CREATED SIZE
registry.gitlab.com/samba-team/devel/samba/samba-ci-fedora29
b4dc3f0b446dbdc20779ae2090de0f5c0da9caef 85af60d25c85 4 days ago 1.32GB


you can then use the image id with to attach to it

docker run -it 85af60d25c85

inside the container you can clone samba git repo and csbuild is
available for you


Noel



