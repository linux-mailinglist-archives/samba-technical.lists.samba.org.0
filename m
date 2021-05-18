Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0124B38702F
	for <lists+samba-technical@lfdr.de>; Tue, 18 May 2021 05:16:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=7c/z7LFHlQKT/EPuR/gOGneLSwqAC75WN3C2hJK9pXg=; b=vJRvOgdymr6GahZqnCzZVCnRxT
	FMn+RBipmHgO11Q1gW+bRvD0ZpwAIEfCOHPx9OGYnLDcgLD2ZRhXF48sF1Ji4ri353E8gd9MscCEi
	meIo0xtoDLGNvPeMF6xZ5L9VVLMUPPWlYpWLmSRUtq2YzUUKLtZQGiPpXhwb0gdjxiRhlXfKf3vss
	G6Xu3Yu6KfVzlGGba44pudsFWxhBEHGYD6/1XuB9JNz88f8oD0Ov2THmODN4xYxqwGn1fcLGB0Fml
	D/i1aZrrqbwXY4MM8oiLcXnqtBMsMgDz+IpxAr1u/ZwFyDXDP/194NTiaLNmpgZdBn+eaWn3LAiz3
	+RAABFhA==;
Received: from ip6-localhost ([::1]:44824 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1liqCe-0016Gs-4o; Tue, 18 May 2021 03:15:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54654) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1liqCZ-0016Gj-0T
 for samba-technical@lists.samba.org; Tue, 18 May 2021 03:15:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=7c/z7LFHlQKT/EPuR/gOGneLSwqAC75WN3C2hJK9pXg=; b=Y98NZHb4K39eXuFg7cnxFY2L31
 GXTil3MwqFp1dEow6SwCVnbpCG/zwzUSWO47x6OVFGUIIMh4ugBzbDtLNkjnJ5NOMH9gbgLlVqDJX
 /703iJe/bjLod7CGP+vrIj/Fuo/n/K4dQkxfixRMoMbVXC/fT8qDrvaiNLwIqvGwGnQGPsY0EbPNQ
 2gKVyMNhQXRkS6GPcfW60fLH2FmiOYJhddQrd2gyi/i2e0op6mzJgSpmmEsvBWZyuJdyJkhC8wfzB
 63HEzDh7zt6PsBz8wEzcn06ZNWeOOnfYFVOvhSTS0fLxOtpmqIsqhL/NTxsdARLSEJBJSbjrJoI+h
 fQo17fdOjHQE9fRLehGHDx5ICSA6wkct01JmQz4bMzZE2x2I2JuIGF1iDBFyXC3jEiAEvDs02MRTK
 czg/ggjN9uqghi715+ZXQ+ouGbRMV0WkqZ00P5fniGNkSgG32s5QK7uj3O2FD1yFqNZpvSfRY94KK
 tbnLEJF2cTUncwRtoPyOKqk+;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1liqCW-0002WL-Bc; Tue, 18 May 2021 03:15:21 +0000
Message-ID: <5d5b4c230813b6bd6b3001fe14bfd3a9d8ca2b53.camel@samba.org>
Subject: Re: Problem with AD membership in an AD with more the 100.000 group
 (possible regression in 4.12?)
To: "Dr." =?ISO-8859-1?Q?Hansj=F6rg?= Maurer <hansjoerg.maurer@itsd.de>, 
 samba-technical@lists.samba.org
Date: Tue, 18 May 2021 15:15:15 +1200
In-Reply-To: <d7b0ec24-3c59-1d74-9e93-616eebe6eb44@itsd.de>
References: <d7b0ec24-3c59-1d74-9e93-616eebe6eb44@itsd.de>
Content-Type: multipart/mixed; boundary="=-bhFkXbvh3JKQETQ249Ob"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
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


--=-bhFkXbvh3JKQETQ249Ob
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-05-17 at 19:18 +0200, Dr. Hansjörg Maurer via samba-
technical wrote:
> Hi
> 
>   - sorry for the noise, did not find the "plain switch" for our
> mail 
> gateway -
> here the original mail (hopefully)
> samba 4.12.3 on CentOS-8
> I am  trying to run a wbinfo -g on an AD memberserver in an  AD with 
> more the 100.000 groups and it shows no output
> 
> The samba logs shows
>    list_groups XXX
> [2021/05/17 14:21:49.826967,  1]
> ../../librpc/ndr/ndr.c:632(_ndr_pull_error)
>    ndr_pull_array_size: ndr_pull_error(Range Error): More than 65535
> NDR 
> tokens stored for array_size at ../../librpc/ndr/ndr.c:1093
> 

Ouch.  This isn't good.

While of course you could locally patch to increase the limit, I'm
really not sure what to do here, because the way the NDR tokens are
handled, some of the behaviour is N^2, so large numbers are a really
bad idea.

Can you attach a debugger and break on that line?  (It might take some
trial/error to find the right process).  It would be helpful to know
exactly which structure can't be parsed.  If it is this one from
winbind.idl:
     NTSTATUS wbint_QueryGroupList(
	[out] wbint_Principals *groups
	);

Then we have more hope of being able to modify the structure to be less
resource-consuming.

I wonder if changing to a different string type would help.  Thankfully
this isn't a public protocol, so we can be flexible.

Try the attached patch.  It uses an encoding that stores the strings as
<num bytes><string> rather than <num bytes><pointer> .... <string>,
which needs these 'tokens' to get between the stages.

Andrew Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions





--=-bhFkXbvh3JKQETQ249Ob
Content-Disposition: attachment; filename="less-unique-pointers-in-winbind.patch"
Content-Transfer-Encoding: base64
Content-Type: text/x-patch; name="less-unique-pointers-in-winbind.patch";
	charset="UTF-8"

ZGlmZiAtLWdpdCBhL2xpYnJwYy9pZGwvd2luYmluZC5pZGwgYi9saWJycGMvaWRsL3dpbmJpbmQu
aWRsCmluZGV4IGEyYmM4MWE5MzMzLi42ZDQ1MjkzYWFmZSAxMDA2NDQKLS0tIGEvbGlicnBjL2lk
bC93aW5iaW5kLmlkbAorKysgYi9saWJycGMvaWRsL3dpbmJpbmQuaWRsCkBAIC03MywxNCArNzMs
MTQgQEAgaW50ZXJmYWNlIHdpbmJpbmQKIAkpOwogCiAgICAgdHlwZWRlZiBbcHVibGljXSBzdHJ1
Y3QgewotCVtzdHJpbmcsY2hhcnNldChVVEY4KV0gY2hhciAqZG9tYWluX25hbWU7Ci0JW3N0cmlu
ZyxjaGFyc2V0KFVURjgpXSBjaGFyICphY2N0X25hbWU7Ci0JW3N0cmluZyxjaGFyc2V0KFVURjgp
XSBjaGFyICpmdWxsX25hbWU7Ci0JW3N0cmluZyxjaGFyc2V0KFVURjgpXSBjaGFyICpob21lZGly
OwotCVtzdHJpbmcsY2hhcnNldChVVEY4KV0gY2hhciAqc2hlbGw7CisJW3N0cmluZyxjaGFyc2V0
KFVURjgpXSBjaGFyIGRvbWFpbl9uYW1lW107CisJW3N0cmluZyxjaGFyc2V0KFVURjgpXSBjaGFy
IGFjY3RfbmFtZVtdOworCVtzdHJpbmcsY2hhcnNldChVVEY4KV0gY2hhciBmdWxsX25hbWVbXTsK
Kwlbc3RyaW5nLGNoYXJzZXQoVVRGOCldIGNoYXIgaG9tZWRpcltdOworCVtzdHJpbmcsY2hhcnNl
dChVVEY4KV0gY2hhciBzaGVsbFtdOwogCWh5cGVyIHVpZDsKIAloeXBlciBwcmltYXJ5X2dpZDsK
LQlbc3RyaW5nLGNoYXJzZXQoVVRGOCldIGNoYXIgKnByaW1hcnlfZ3JvdXBfbmFtZTsKKwlbc3Ry
aW5nLGNoYXJzZXQoVVRGOCldIGNoYXIgcHJpbWFyeV9ncm91cF9uYW1lW107CiAJZG9tX3NpZCB1
c2VyX3NpZDsKIAlkb21fc2lkIGdyb3VwX3NpZDsKICAgICB9IHdiaW50X3VzZXJpbmZvOwpAQCAt
MTE2LDcgKzExNiw3IEBAIGludGVyZmFjZSB3aW5iaW5kCiAgICAgdHlwZWRlZiBbcHVibGljXSBz
dHJ1Y3QgewogCWRvbV9zaWQgc2lkOwogCWxzYV9TaWRUeXBlIHR5cGU7Ci0JW3N0cmluZyxjaGFy
c2V0KFVURjgpXSBjaGFyICpuYW1lOworCVtzdHJpbmcsY2hhcnNldChVVEY4KV0gY2hhciBuYW1l
W107CiAgICAgfSB3YmludF9QcmluY2lwYWw7CiAKICAgICB0eXBlZGVmIFtwdWJsaWNdIHN0cnVj
dCB7Cg==


--=-bhFkXbvh3JKQETQ249Ob--


