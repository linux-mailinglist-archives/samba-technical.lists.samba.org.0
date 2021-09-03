Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F2152400594
	for <lists+samba-technical@lfdr.de>; Fri,  3 Sep 2021 21:13:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=PWpk1eRR55pP1yL7wcjqMvkvAVOIh+uuwrFOtgR7tW0=; b=O5D/3e2FCvs0ohVD0665P5pG10
	gVbz3EMrjN0ltzctkNcYU+uIbKGggkeeI+LBQNQ6xqdh68tR6nbEyA8Xq+OowlNK/FVxOa0jsdkak
	xitDQtNqSbt9MMsZKLKazPxsdnGvbxNv4L1JWIkzCNPjtDZonCy2Ap3wy0m5ymZENAL+RXLMxRpWS
	9tr7QYP1fcSiZV/UJjSCapnrktDRl8MyuXCzhRdRqYFa5ubiFMBkqA9VCvALjvZD5Kg6TawRXV5NQ
	B1KtPBTGNpiVHdR3z+0UIub5Zo2+MkBYg/2gjYvYd0iFor9WmkUiJy3mTkfFUsAJnM1eLZkJrfeIn
	mEHNmIaA==;
Received: from ip6-localhost ([::1]:56342 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mMEbb-00DDX1-Mj; Fri, 03 Sep 2021 19:12:03 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15882) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mMEbV-00DDWs-Us
 for samba-technical@lists.samba.org; Fri, 03 Sep 2021 19:12:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=PWpk1eRR55pP1yL7wcjqMvkvAVOIh+uuwrFOtgR7tW0=; b=FlZi8Bms3N4DihbQ8CY69WJSF/
 x0tuzOYDvgi760t3NSEqk5DBe/Av+1uXEv1mv/WBc6pyOn1WV/IxwA/2TQcVkrxWLMhh3x/15Nrqq
 r77samPF6s5Ts17om1+qdu6868fzdtetfMnQEzO2+1nkyzCJIyUbF9Z/5ls5p+aBFF+8jexqRJJiR
 nvtjylQwyC/cy9X2jVFwX2lE/MTrLKkV58C9HGFUpWfxGdwIg2ihANDLvIbDMI2cN4JziCw5WfMlV
 mCFWzwXWfCpVlXZSWYk5uWsCVrQvcnK5msvOw60tW7F1a3mM+OF5NeLFjMFFuSgHpuF874j/0NHhR
 VBL6ZK/7lMspau+67JVYGK9Hl0kDUDS2hz9veIu0R0K/1lF5evQrtvrycqnwjFnryNG/+ItUVzs0N
 89t15t02kUrMnuJmDvnYBr4nDDVMqlkAExkA7f6Y2C/l/AmwwuQeblTu/12CpSelswZu4Xw9GbuWl
 hYPxS5alL4POjZZ4PzNHP/88;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mMEbU-004VQK-Ms; Fri, 03 Sep 2021 19:11:56 +0000
Subject: Re: OSS-fuzz needs some love
To: Andrew Bartlett <abartlet@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
References: <599cb100381a83de23ae9db47e3fa55eb87a7f13.camel@samba.org>
 <b4086e94339753e8ee26d4443f4924b7889ee9dc.camel@samba.org>
Message-ID: <2fc73976-5505-cbb9-7341-10c323b7a095@samba.org>
Date: Fri, 3 Sep 2021 22:11:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b4086e94339753e8ee26d4443f4924b7889ee9dc.camel@samba.org>
Content-Type: multipart/mixed; boundary="------------B73BFC2E1B7BC4CDF3C01BCE"
Content-Language: en-US
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
From: Uri Simchoni via samba-technical <samba-technical@lists.samba.org>
Reply-To: Uri Simchoni <uri@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a multi-part message in MIME format.
--------------B73BFC2E1B7BC4CDF3C01BCE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

With the attached obvious patch, the oss-fuzz build succeeds on their 
stock image. Haven't actually *ran* the fuzzer binaries though.

What do you suppose I should do on the oss-fuzz side? Do I just issue a 
pull request, or do I have to be listed somewhere?

Regarding drop of 16.04 build, we don't seem to have one in CI, so I can 
just remove the old Python exception. Do note however that oss-fuzz 
builds with clang, so we might want to have an Ubuntu 20.04+clang CI job 
to ensure that build doesn't fail when it gets to oss-fuzz.

I hope that helps,
Uri.

On 9/1/21 11:10 PM, Andrew Bartlett via samba-technical wrote:
> 
> Looks like work needs to be done to confirm we build in oss-fuzz mode
> on 20.04, upgrade the Dockerfile on their side to say so, then on our
> side drop the 16.04 build (and the old python exception for the fuzzing
> case in buildtools/wafsamba/samba_python.py).
> 
> Andrew Bartlett
> 


--------------B73BFC2E1B7BC4CDF3C01BCE
Content-Type: text/plain; charset=UTF-8;
 name="upgrade-oss-fuzz.patch.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="upgrade-oss-fuzz.patch.txt"

RnJvbSA4ODg2MDcyNDY0ZDZhMjE2MjM2MDE5ZjJjM2I1NTM2YWNkOTBiYmQyIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBVcmkgU2ltY2hvbmkgPHVyaUBzYW1iYS5vcmc+CkRh
dGU6IEZyaSwgMyBTZXAgMjAyMSAxODo0NjoxNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGZ1
enppbmcvb3NzLWZ1eno6IGZpeCBpbWFnZSBidWlsZCByZWNpcGUgZm9yIFVidW50dSAyMC4w
NAoKVXBkYXRlIHRoZSBidWlsZF9pbWFnZS5zaCBzY3JpcHQgdG8gaW5zdGFsbCBVYnVudHUg
MjAuMDQgcGFja2FnZXMKaW5zdGVhZCBvZiBVYnVudHUgMTYuMDQgb24gdGhlIG9zcy1mdXp6
IGNvbnRhaW5lciAtIHRoaXMgd2lsbAphbGxvdyB0aGUgb3NzLWZ1enogY29udGFpbmVyIHRv
IGJlIGJhc2VkIG9uIFVidW50dSAyMC4wNC4KClNpZ25lZC1vZmYtYnk6IFVyaSBTaW1jaG9u
aSA8dXJpQHNhbWJhLm9yZz4KLS0tCiBsaWIvZnV6emluZy9vc3MtZnV6ei9idWlsZF9pbWFn
ZS5zaCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2xpYi9mdXp6aW5nL29zcy1mdXp6L2J1aWxkX2ltYWdlLnNo
IGIvbGliL2Z1enppbmcvb3NzLWZ1enovYnVpbGRfaW1hZ2Uuc2gKaW5kZXggNWRmMDdkYzQz
YmUuLjVkNWUyN2U3MTZkIDEwMDc1NQotLS0gYS9saWIvZnV6emluZy9vc3MtZnV6ei9idWls
ZF9pbWFnZS5zaAorKysgYi9saWIvZnV6emluZy9vc3MtZnV6ei9idWlsZF9pbWFnZS5zaApA
QCAtMSw2ICsxLDYgQEAKICMhL2Jpbi9zaCAtZQogCi1ESVNUPXVidW50dTE2MDQKK0RJU1Q9
dWJ1bnR1MjAwNAogU0NSSVBUX0RJUj1gZGlybmFtZSAkMGAKIAogJFNDUklQVF9ESVIvLi4v
Li4vLi4vYm9vdHN0cmFwL2dlbmVyYXRlZC1kaXN0cy8kRElTVC9ib290c3RyYXAuc2gKLS0g
CjIuMzMuMAoK
--------------B73BFC2E1B7BC4CDF3C01BCE--

