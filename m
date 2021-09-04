Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BABD9400A83
	for <lists+samba-technical@lfdr.de>; Sat,  4 Sep 2021 12:31:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=kPcAHDmGJfkrEsjeeWLOVt/kdyNAsw8+2vNtjQLNSH8=; b=Abu6UT9jhm4ozap0+jcGop627i
	jmfzLj7wsxjSP6RskcRkHQ+IuGLUmbUG7i1RAH29vz5t6jG1b1IeNZcFay0zVi1vmOfzsIT4oWd3Z
	AS0O9yh0+POcH0aQALhOcW1pWhbeHCmZhbDmo5Egs5msS8J/6UStSyLqEWm8n0XzwBhrn6WMwa5MX
	60Rucxd6z8Qip0YVTln+gfWs1e918hvO2G36R8WceH0pulUIH3N23XPOHx8SpUhNmcugzdkJjIHEm
	byA65+BreARUzNEgN8O4g+B61Uw/phaKmwoAGcqLjf0epSE444rEiH85z7HnDjUyUDp/j8LyYZkhc
	se0TFH5g==;
Received: from ip6-localhost ([::1]:63174 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mMSwk-00DIB4-Mv; Sat, 04 Sep 2021 10:30:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48958) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mMSwe-00DIAv-GT
 for samba-technical@lists.samba.org; Sat, 04 Sep 2021 10:30:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=kPcAHDmGJfkrEsjeeWLOVt/kdyNAsw8+2vNtjQLNSH8=; b=czwyVuMpwjEOulsaHlN+GOPdqn
 AZUnBmqBm0Cl8LNC35mW1rt8W4/G9xcjfPK7KT3qzQNAwRN5LqzY78U8KFYGbFcCHW1CmRQaEcvFj
 FAoSByTfczuYQnFfZuW6BKYg82xbxCed0VDD1B0afZW9KV8Ikr8ea5b9VObbcIHOgR8YN34XTmn7/
 9NLCqs0HwhrHSRxc5/7bfBhssqdIXmGc1ghAwr3AwSK8GoNATpky2WI7janl0MTGxS3/uCusTweL5
 3zivzCZc5kJ8qgU5Ru6TTcyNZ39qQ2Ksnn+PI9Nzt9FVU3PahTUsQpjSfKiZ/YjhNoPOdrtkiV+wk
 QfxYDmWATfjnZM9svkpSXMU0EhJjBMhRMGDe5alyL8owSJNBittHBppBExyG5F8OwHZ4VO/wVR+44
 mLH5/L6h2TXuf9lxYBU1HQwfuXRqu9VIop7pZC6nrgAV2tQhpC/FyQx/epyPsYBNx6CuCyMB3kOFM
 wIN+0fa7VznuoLoxC1G3f+v2;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mMSwc-004bnK-Eh; Sat, 04 Sep 2021 10:30:42 +0000
Subject: Re: OSS-fuzz needs some love
To: Andrew Bartlett <abartlet@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
References: <599cb100381a83de23ae9db47e3fa55eb87a7f13.camel@samba.org>
 <b4086e94339753e8ee26d4443f4924b7889ee9dc.camel@samba.org>
 <2fc73976-5505-cbb9-7341-10c323b7a095@samba.org>
 <f2b1e57143e2fdfc2865de71412399d7c156333a.camel@samba.org>
Message-ID: <b316c4a8-23e0-b35d-033a-5176a271ba4b@samba.org>
Date: Sat, 4 Sep 2021 13:30:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f2b1e57143e2fdfc2865de71412399d7c156333a.camel@samba.org>
Content-Type: multipart/mixed; boundary="------------35B35AFA417DBA2ABA41E42D"
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
--------------35B35AFA417DBA2ABA41E42D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

What I have so far is in 
https://gitlab.com/samba-team/samba/-/merge_requests/2152

I'll continue this in a few days hopefully.

One fuzzer, namely fuzz_parse_lpq_entry, doesn't pass check_build, 
whereas the others pass the check_build of oss-fuzz (at least in address 
sanitizer and libfuzzer mode). Our check_build.sh stops as soon as it 
reaches fuzz_parse_lpq_entry so IDK if it passes the rest (probably yes 
because of the oss-fuzz result).

The issue with fuzz_parse_lpq_entry seems to be that it references 
libtracker-data.so without RPATH.

The changes I made to oss-fuzz code base to test this are in the 
attached patch set - the first patch does the actual upgrade, and the 
others are to support testing from local source on my machine.

Using those patches I basically follow the instructions from 
https://google.github.io/oss-fuzz/advanced-topics/reproducing/#reproducing-build-failures 
that is running from the oss-fuzz root dir:

python infra/helper.py build_image samba
python infra/helper.py build_fuzzers --sanitizer address --engine 
libfuzzer --architecture x86_64
python infra/helper.py check_build --sanitizer address --engine 
libfuzzer --architecture x86_64

Uri.

On 9/3/21 10:49 PM, Andrew Bartlett wrote:
> On Fri, 2021-09-03 at 22:11 +0300, Uri Simchoni wrote:
>> With the attached obvious patch, the oss-fuzz build succeeds on
>> their
>> stock image. Haven't actually *ran* the fuzzer binaries though.
> 
> If you could run some of the check_build steps that would be awesome.
> 
> https://google.github.io/oss-fuzz/advanced-topics/reproducing/#reproducing-build-failures
> 
>> What do you suppose I should do on the oss-fuzz side? Do I just issue
>> a
>> pull request, or do I have to be listed somewhere?
> 
> A pull request is all they need, you will have to do a CLA.  Do that
> once you get your change in master via the normal process.
> 
>> Regarding drop of 16.04 build, we don't seem to have one in CI, so I
>> can
>> just remove the old Python exception. Do note however that oss-fuzz
>> builds with clang, so we might want to have an Ubuntu 20.04+clang CI
>> job
>> to ensure that build doesn't fail when it gets to oss-fuzz.
> 
> See the samba-fuzz target in .gitlab-ci-main.yml.  That needs to match
> your change in what you attached.
> 
> In terms of the clang thing, as a second step we could change that
> target to more closely match oss-fuzz now it has a modern base.
> 
> Thanks so much!
> 
> Andrew Bartlett
> 
>> I hope that helps,
>> Uri.
>>
>> On 9/1/21 11:10 PM, Andrew Bartlett via samba-technical wrote:
>>> Looks like work needs to be done to confirm we build in oss-fuzz
>>> mode
>>> on 20.04, upgrade the Dockerfile on their side to say so, then on
>>> our
>>> side drop the 16.04 build (and the old python exception for the
>>> fuzzing
>>> case in buildtools/wafsamba/samba_python.py).
>>>
>>> Andrew Bartlett
>>>


--------------35B35AFA417DBA2ABA41E42D
Content-Type: text/plain; charset=UTF-8;
 name="upgrade-samba-build.patch.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="upgrade-samba-build.patch.txt"

RnJvbSBmZWJiNjlkOTlhNjZmZWJmZmRhZjg3NDFmYmQ1NmMzMjRkNGQyM2RlIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBVcmkgU2ltY2hvbmkgPHVyaXNpbWNob25pQGdtYWls
LmNvbT4KRGF0ZTogU2F0LCA0IFNlcCAyMDIxIDA3OjU1OjAyICswMzAwClN1YmplY3Q6IFtQ
QVRDSCAxLzNdIHByb2plY3RzL3NhbWJhOiB1c2UgVWJ1bnR1IDIwLjA0IGltYWdlCgpTaWdu
ZWQtb2ZmLWJ5OiBVcmkgU2ltY2hvbmkgPHVyaXNpbWNob25pQGdtYWlsLmNvbT4KLS0tCiBw
cm9qZWN0cy9zYW1iYS9Eb2NrZXJmaWxlIHwgNiArLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wcm9qZWN0cy9z
YW1iYS9Eb2NrZXJmaWxlIGIvcHJvamVjdHMvc2FtYmEvRG9ja2VyZmlsZQppbmRleCBlMmQ3
ZjU0Yi4uM2QzZWUzNWEgMTAwNjQ0Ci0tLSBhL3Byb2plY3RzL3NhbWJhL0RvY2tlcmZpbGUK
KysrIGIvcHJvamVjdHMvc2FtYmEvRG9ja2VyZmlsZQpAQCAtMTQsMTEgKzE0LDcgQEAKICMK
ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLSMgVXNpbmcgVWJ1bnR1IDE2LjA0IGJl
Y2F1c2Ugb2YgYnJlYWthZ2Ugb24gVWJ1bnR1IDIwLjA0LgotIyBTZWUgaHR0cHM6Ly9naXRo
dWIuY29tL2dvb2dsZS9vc3MtZnV6ei9pc3N1ZXMvNjI5MSBmb3IgbW9yZSBkZXRhaWxzLgot
RlJPTSBnY3IuaW8vb3NzLWZ1enotYmFzZS9iYXNlLWJ1aWxkZXI6eGVuaWFsCi0jIERlbGV0
ZSBsaW5lIGFib3ZlIGFuZCB1bmNvbW1lbnQgbGluZSBiZWxvdyB0byB1cGdyYWRlIHRvIDIw
LjA0LgotIyBGUk9NIGdjci5pby9vc3MtZnV6ei1iYXNlL2Jhc2UtYnVpbGRlcgorRlJPTSBn
Y3IuaW8vb3NzLWZ1enotYmFzZS9iYXNlLWJ1aWxkZXIKIAogUlVOIGdpdCBjbG9uZSBodHRw
czovL2dpdGxhYi5jb20vc2FtYmEtdGVhbS9zYW1iYSBzYW1iYQogUlVOIHNhbWJhL2xpYi9m
dXp6aW5nL29zcy1mdXp6L2J1aWxkX2ltYWdlLnNoCi0tIAoyLjMxLjEKCgpGcm9tIGRiMzE1
NzBjNjkwNzExOTUxZjA5ZTE2ZGJiNDQ1MDA1NDk4YzdmMGMgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCkZyb206IFVyaSBTaW1jaG9uaSA8dXJpc2ltY2hvbmlAZ21haWwuY29tPgpEYXRl
OiBTYXQsIDQgU2VwIDIwMjEgMTM6MDg6NTcgKzAzMDAKU3ViamVjdDogW1BBVENIIDIvM10g
Rk9SLVRFU1RJTkc6IHdvcmsgYXJvdW5kIHBvZG1hbiBpc3N1ZQoKLS0tCiBpbmZyYS9oZWxw
ZXIucHkgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2luZnJhL2hlbHBlci5weSBiL2luZnJhL2hlbHBlci5w
eQppbmRleCBmOWI4NmE2Yi4uMzRkMzY3MDQgMTAwNzU1Ci0tLSBhL2luZnJhL2hlbHBlci5w
eQorKysgYi9pbmZyYS9oZWxwZXIucHkKQEAgLTYzNiw3ICs2MzYsOCBAQCBkZWYgYnVpbGRf
ZnV6emVyc19pbXBsKCAgIyBweWxpbnQ6IGRpc2FibGU9dG9vLW1hbnktYXJndW1lbnRzLHRv
by1tYW55LWxvY2Fscyx0bwogICBpZiBlbnZfdG9fYWRkOgogICAgIGVudiArPSBlbnZfdG9f
YWRkCiAKLSAgY29tbWFuZCA9IFsnLS1jYXAtYWRkJywgJ1NZU19QVFJBQ0UnXSArIF9lbnZf
dG9fZG9ja2VyX2FyZ3MoZW52KQorIyAgY29tbWFuZCA9IFsnLS1jYXAtYWRkJywgJ1NZU19Q
VFJBQ0UnXSArIF9lbnZfdG9fZG9ja2VyX2FyZ3MoZW52KQorICBjb21tYW5kID0gX2Vudl90
b19kb2NrZXJfYXJncyhlbnYpCiAgIGlmIHNvdXJjZV9wYXRoOgogICAgIHdvcmtkaXIgPSBf
d29ya2Rpcl9mcm9tX2RvY2tlcmZpbGUocHJvamVjdCkKICAgICBpZiBtb3VudF9wYXRoOgot
LSAKMi4zMS4xCgoKRnJvbSA0NDlmYWY3OWE1MDE3ODkxZjA4OTBhZWViYTEzMGNlMzQxOTlm
YTIxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBVcmkgU2ltY2hvbmkgPHVyaXNp
bWNob25pQGdtYWlsLmNvbT4KRGF0ZTogU2F0LCA0IFNlcCAyMDIxIDEzOjA5OjM0ICswMzAw
ClN1YmplY3Q6IFtQQVRDSCAzLzNdIEZPUi1URVNUSU5HOiBidWlsZCBzYW1iYSBvc3MtZnV6
eiBpbWFnZSB3aXRoIGxvY2FsIHNvdXJjZQogdGFyYmFsbAoKVG8gZ2VuZXJhdGUgdGhlIHRh
cmJhbGwsIHVzZToKCmdpdCBhcmNoaXZlIC0tcHJlZml4PXNhbWJhLyAtbyB+L3NhbWJhLW9z
cy1mdXp6LnRneiBIRUFECgpBbmQgdGhlbiBjb3B5IHRoZSB0YXJiYWxsIHRvIHByb2plY3Rz
L3NhbWJhLwotLS0KIHByb2plY3RzL3NhbWJhL0RvY2tlcmZpbGUgfCAzICsrLQogMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L3Byb2plY3RzL3NhbWJhL0RvY2tlcmZpbGUgYi9wcm9qZWN0cy9zYW1iYS9Eb2NrZXJmaWxl
CmluZGV4IDNkM2VlMzVhLi4wODI1YWExYyAxMDA2NDQKLS0tIGEvcHJvamVjdHMvc2FtYmEv
RG9ja2VyZmlsZQorKysgYi9wcm9qZWN0cy9zYW1iYS9Eb2NrZXJmaWxlCkBAIC0xNiw3ICsx
Niw4IEBACiAKIEZST00gZ2NyLmlvL29zcy1mdXp6LWJhc2UvYmFzZS1idWlsZGVyCiAKLVJV
TiBnaXQgY2xvbmUgaHR0cHM6Ly9naXRsYWIuY29tL3NhbWJhLXRlYW0vc2FtYmEgc2FtYmEK
KyNSVU4gZ2l0IGNsb25lIGh0dHBzOi8vZ2l0bGFiLmNvbS9zYW1iYS10ZWFtL3NhbWJhIHNh
bWJhCitBREQgc2FtYmEtb3NzLWZ1enoudGd6ICRTUkMvCiBSVU4gc2FtYmEvbGliL2Z1enpp
bmcvb3NzLWZ1enovYnVpbGRfaW1hZ2Uuc2gKIAogV09SS0RJUiBzYW1iYQotLSAKMi4zMS4x
Cgo=
--------------35B35AFA417DBA2ABA41E42D--

