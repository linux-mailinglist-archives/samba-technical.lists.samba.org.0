Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A74E8134B4
	for <lists+samba-technical@lfdr.de>; Thu, 14 Dec 2023 16:26:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=e/mAtyQYqgwikXez79P9JMftgCyqAjl0CE2MO1v8Z2A=; b=qAxFQPDSRZG+ALOmTOLFcEafXF
	1xwY9Z7PKGu0jQZKNFXiKB5p7X5LxvjgQlwxqPZ6nzbbAb0iksnoPPVT8JUVVPui4S3PsdkowRSKj
	ns2Et7FpeYsiRaAV0bGFc7Wkh7mJoLyRbZsjJlj4gSCemFKYRThFfif5e+mBIKqNPnAdBfhIVlixp
	1FjqJITNSh6W0LIVQkyy+1LgYFsCReoGdOrYKbCJd4OOeeh0wiPE+xgRAgdtND2g2WFG2asxL4MnO
	i6UbYci9xqbmVOTFqrFjOWEvXfL3ZKgx3oKi6y5nnUtDpu5TJ5Oz9p8D1unE1l6GiKfTfrjdSflEZ
	RJlo2eVA==;
Received: from ip6-localhost ([::1]:46324 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rDnaY-007JmM-JL; Thu, 14 Dec 2023 15:25:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24902) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1rDnaM-007JmA-5s
 for samba-technical@lists.samba.org; Thu, 14 Dec 2023 15:25:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=e/mAtyQYqgwikXez79P9JMftgCyqAjl0CE2MO1v8Z2A=; b=fg5i20HcFhhM/tMsi1XOHQTEum
 R5JWJp+6Ug45qd1TEd1I4vSUPuADo3bqZGkrhDM/O2zjA25a5CpknVN2yw9MF313Ueg2z2ynMgjr6
 e03VPQHJAgEltc5NboY4r+qhAv3byCFJKZeF2cpM/NwT0ejBK3HffPdWQBAtHEr9mjGLKisOurkGF
 gg/J5jiPk3FuX4OvyRToGo4DvC6MWXtEqkgGXJJOJ36GaTQVHye4sTIiLoQ8xq6j5HlKmN2YpQxS4
 dILon7Re8IAzP7aJqKwMkHp13z4De2dBuZ067a1nROB0Xycu7yJn63YLvCrAbk7n1kcrWFc/syqBi
 Avs0p8PeCL+tt198RU4dLZHyoAvEyjJ0SU3UuteD42z65BqmfH/kDdkLEp2IG5xOn69TY1DYAQ7Ed
 loK/bCqcBPjCa6983h7OeQAsEuWw5TcY2VUxEN+mjmMHcgZNwMNnHrGPfhJ5JD+ZOMMEZvvhyO9dd
 4MDoFT91bXsYxvtyJ0teIZwf;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rDnaK-003f5D-1F for samba-technical@lists.samba.org;
 Thu, 14 Dec 2023 15:25:12 +0000
Message-ID: <ddf5ae2e-0bb0-825e-5dde-67003aa419bc@samba.org>
Date: Thu, 14 Dec 2023 08:25:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: Group Policy Ordering
Content-Language: en-US
To: samba-technical@lists.samba.org
References: <8fde5c31-92cb-4f66-a2d1-95f7ba4e7f1b@app.fastmail.com>
In-Reply-To: <8fde5c31-92cb-4f66-a2d1-95f7ba4e7f1b@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: David Mulder via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Mulder <dmulder@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


On 12/13/23 5:20 PM, Joe Dillon via samba-technical wrote:
> Suppose I link a policy called "Test Policy 1".  When samba-gpupdate runs, this policy will be in changed_gpo_list.  Suppose it sets the contents of /etc/test.txt to "testpolicy1".  The second time samba-gpupdate runs, it will not be in changed_gpo_list, and the CSE won't rewrite the file.  So far so good.  Now, I toggle "Test Policy 1" to enforced.  Rerunning samba-gpupdate does not process the policy.  Again, so far so good.  Suppose I link "Test Policy 2", unenforced.  Let's say the CSE for "Test Policy 2" would set the content of /etc/test.txt to "testpolicy2".  I would expect, since "Test Policy 1" has a higher priority, the contents of /etc/test.txt after a samba-gpupdate to be "testpolicy1".  When I run samba-gpupdate,  only "Test Policy 2" is processed, since it is the only one that changed.  "--force" obviously corrects the issue.
>
> Is this intended behaviour or a bug?
This behavior changed significantly in recent versions of Samba. Which 
version are you referring to? Also, policy enforcement is handled 
per-extension, so you may see different behavior for each extension. 
 From your description, I would expect that there may be a bug in 
processing the changed_gpo_list?
> Second question: is it valid for GPOs based on .pol files to not write the registry entries to the local registry?  The above behaviour could be avoided if every gpupdate wrote all changes from all applicable GPOs to the registry and deferred processing to the end.
This was in the works 4 years ago, but was never completed. The current 
approach is for each extension to write their overlapping changes to a 
tdb file, and apply the appropriate policy from there.

-- 
David Mulder
Labs Software Engineer, Samba
SUSE
1221 S Valley Grove Way, Suite 500
Pleasant Grove, UT 84062
(P)+1 385.208.2989
dmulder@suse.com
http://www.suse.com


