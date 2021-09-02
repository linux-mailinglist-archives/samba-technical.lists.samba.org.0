Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E2A3FF62A
	for <lists+samba-technical@lfdr.de>; Thu,  2 Sep 2021 23:53:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=jLM7GN9N4yRdvNkHLurZMFV1s0ao7MjvjOqcGdxvUOo=; b=TQweJK+l6IhVnW9D2GVQWc3IzS
	RnwffMowTb79Fz4lHLu/WR4WtbR0ojn5hhyRwk59EJwu8gGr99tqReDij82ZUE5FvWi9yhVdVG1GP
	MYJpoktlTarvY9zqBfxoMGIEQbyM1xbKShuqyFZsAwgfS+QkOkSJfyJlrfJR0+FjhrKqeWESPuA7X
	svLw01rHZZJNJQbWvXnJGpNR/sIARJUl8Ww+HNIUYl2xe9w45adgVQGtryyPtikQeC0skmKurxtwA
	F9cfrsaQhnu6jVdMr/u8Gtc+iOUY9+v4kFdtL9a22RozMhURU2bXqI8EWZyCMqUHIaoI1757M8TiQ
	pKptNNlw==;
Received: from ip6-localhost ([::1]:58780 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mLud0-00Cra5-4k; Thu, 02 Sep 2021 21:52:10 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:44770) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mLucs-00CrZw-7e
 for samba-technical@lists.samba.org; Thu, 02 Sep 2021 21:52:07 +0000
Received: by mail-qt1-x836.google.com with SMTP id r21so2940906qtw.11
 for <samba-technical@lists.samba.org>; Thu, 02 Sep 2021 14:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mattgrant-net-nz.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=HbsCeDo99l08UvMUXuacy1CFYjxU3qqWMywVN/DlZfA=;
 b=u4zSuOgfFUgTD6hAXHDyXe4GrpCuivBrvX80gsbJ9Gva51/dqbdB21HYHxZS0b/RO6
 UveICxaZBZTPMtynYd96AzECr0x6HUfXfGxJQuHIgg+mfDxFX3hs63sstNnZ/fm0Aqdk
 gGvwPSDct9WQc7ZoiX2XxUvEN6fqbaPo8cPFW1+26pnv8t5r9TAfxpndz0C+71I0z4vu
 6x6IVNl0+flNLpUJhwPZ5CSNWPk+aNdNIgdrONO7Fz+DNfFWJXrSz0x5AfiJIss0H/qF
 F1BDwioA4xC6nl04MQhXxTnH00x/GoqkT6UhLOVZDzGrabqVOJg/T+84GI3T7R+e7FP+
 cXUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=HbsCeDo99l08UvMUXuacy1CFYjxU3qqWMywVN/DlZfA=;
 b=YMRl0fcIA0M4QvUhUE4fILoy7WcyfkuZgMz4OVEzkAhbXwFlH9PMQ6BVsu7TCxhG8T
 PLNciKCu9OBKqiUR7NtEu0pr39vdPbYa3/iYp/Ma4pf2H4ZNePv2QKYUTS+YfPhOjc3C
 RT+mulJVMuOTuxR2Pxp6RsQe5dUve3LVNRKTQkLqwBeOyciS+5GzqEBWPsQbPdUUfYUS
 zupmIhs0KmbO462vNuWuJJEp+5334vQeyAZifLCpWD7UMAf7SMeoPF7xCQkZnf1G6EHA
 lzQjrzD14oSTKoMF+u66kog2jPqFMInROMxjiPZJYHaiwJP6UBVqdv96IUK4DdmaLlIN
 NQzg==
X-Gm-Message-State: AOAM532H+u4qvKT1mObFwcw5MbXxsjJ83oPjM/HTVm17CJK6JU/WZ37v
 AbwWAyWTvHA3IOLc7XtBYyi2+f8MoEtLYOthiXalOBr3/MoeQA==
X-Google-Smtp-Source: ABdhPJxoKFaKkW3p6S43sdUpW6lTC4y9bSSjoYeDBfBSWJ3peY5AHjewKeAn/xnUgR/k82SgCM+gTcAOIu1Odk007lI=
X-Received: by 2002:ac8:59c4:: with SMTP id f4mr567788qtf.334.1630619519615;
 Thu, 02 Sep 2021 14:51:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAHA-KoObp6CvJg05wbSypST_4eAtGhuTg9eUkcBYw+PTV612og@mail.gmail.com>
 <YS6StQYsctrwXzvu@jeremy-acer>
 <9f99c5977e7743e615936f070ce8e085a73ed1fb.camel@samba.org>
 <CAHA-KoMdUq9JVWd5ZburyG7cEQG3sGF-N8-99GhQbz-0+Z3qLg@mail.gmail.com>
In-Reply-To: <CAHA-KoMdUq9JVWd5ZburyG7cEQG3sGF-N8-99GhQbz-0+Z3qLg@mail.gmail.com>
Date: Fri, 3 Sep 2021 09:51:48 +1200
Message-ID: <CAHA-KoMQJomEojj98WOZjxJ41VsKd-VrxD0C-iy9en9JAwNYtg@mail.gmail.com>
Subject: Fwd: Help writing new SAMBA_INTERNAL DNS test code please.
To: samba-technical@lists.samba.org
Content-Type: multipart/mixed; boundary="0000000000003b4fc705cb0a31be"
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
From: Matt Grant via samba-technical <samba-technical@lists.samba.org>
Reply-To: Matt Grant <matt@mattgrant.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--0000000000003b4fc705cb0a31be
Content-Type: text/plain; charset="UTF-8"

Hi THere!

Have implemented change to 2nd DNS server entry in samba.tests.dns_forwarder

Cheers,

Matt Grant
---------- Forwarded message ---------
From: Matt Grant <matt@mattgrant.net.nz>
Date: Fri, 3 Sept 2021 at 07:55
Subject: Re: Help writing new SAMBA_INTERNAL DNS test code please.
To: Andrew Bartlett <abartlet@samba.org>


OK,

This is how I will proceed.  I will alter the SAMBA_INTERNAL dns_forwarder
test to have an IPv6 server listening on port 54 for the second forwarder
in that test suite.  However this does not cover off the case where the
second server is an IPv6 only address with out square brackets, no port
number given, defaulting to port 53, but will test the code.

testparm support is another issue.  Have not written code for that as it
does not look at the dns forwarder addresses given.

Patch for new feature is attached.  Just subscribing to Samba bugzilla so I
can log a bug for implementing this feature in master.

Regards,

Matt Grant

On Wed, 1 Sept 2021 at 09:25, Andrew Bartlett <abartlet@samba.org> wrote:

> On Tue, 2021-08-31 at 13:36 -0700, Jeremy Allison via samba-technical
> wrote:
> > On Tue, Aug 31, 2021 at 05:20:57PM +1200, Matt Grant via samba-
> > technical wrote:
> > > Hi Andrew!
> > >
> > > Have not created Samba bugs for the following yet, as I am trying
> > > to get
> > > the hardest part doen, writing the test code.
> > >
> > >   1. Dns server port number specification for smb.conf 'dns
> > > forwarder'
> > >   server list
> > >   2. Restricting the dynamic DNS update ranges so that the
> > > SAMBA_INTERNAL
> > >   server is not spammed with IPv6 PD addresses from the ISP.
> > >
> > > Main issue is being able to dynamically change the smb.conf setup
> > > for the
> > > Python self test hookup, for 1, specifically within
> > > samba.tests.dns_forwarder.  Being able to do this will also make 2
> > > far
> > > easier.  After looking at the test code set up, I can't see how to
> > > dynamically change the smb.conf file in st/samba/smb.conf while the
> > > tests
> > > are running to set up for testing the port numbers or not.
> >
> > Look at tests like:
> >
> > source3/script/tests/test_deadtime.sh
> >
> > they use a feature:
> >
> > global_inject_conf=$(dirname $SMB_CONF_PATH)/global_inject.conf
> >
> > that allows a test to include dynamic smb.conf entries for Samba3
> > tests via the line:
> >
> >          include = $globalinjectconf
> >
> > inside selftest/target/Samba3.pm.
> >
> > I don't think the same feature is in selftest/target/Samba4.pm
> > but I'd look into adding that. It might do what you need.
>
> Sadly the AD DC (except the embedded smbd) still doesn't reload the
> smb.conf (ever!), so that trick won't work.
>
> If custom smb.conf options can't be avoided, they need to be added to
> an existing (if otherwise harmless) or new environment.  Sadly if a new
> server instance (like ad_dc, fl2003dc etc) is needed in Samba4.pm that
> is a fair chunk of work, so we try to fit it in with an existing one.
>
> Sorry!
>
> Andrew Bartlett
>
> --
> Andrew Bartlett (he/him)       https://samba.org/~abartlet/
> Samba Team Member (since 2001) https://samba.org
> Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba
>
> Samba Development and Support, Catalyst IT - Expert Open Source
> Solutions
>
>

--0000000000003b4fc705cb0a31be
Content-Type: application/x-patch; name="dns-forward-port.patch"
Content-Disposition: attachment; filename="dns-forward-port.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kt3ckd570>
X-Attachment-Id: f_kt3ckd570

SW5kZXg6IHNhbWJhL2xpYmNsaS9kbnMvZG5zLmMKPT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQotLS0gc2FtYmEub3JpZy9s
aWJjbGkvZG5zL2Rucy5jCisrKyBzYW1iYS9saWJjbGkvZG5zL2Rucy5jCkBAIC00MSw2ICs0MSwx
MDMgQEAgc3RydWN0IGRuc191ZHBfcmVxdWVzdF9zdGF0ZSB7CiAKICNkZWZpbmUgRE5TX1JFUVVF
U1RfVElNRU9VVCAxMAogCisvKiBmdW5jdGlvbiB0byBnZXQgcGFyc2Ugc2VydmVyIGFkZHJlc3Mg
c3RyaW5nIHRvIGFkZHJlc3MgYW5kIHBvcnQgKi8KK2ludCBkbnNfcGFyc2Vfc2VydmVyX2FkZHJl
c3MoVEFMTE9DX0NUWCAqbWVtX2N0eCwKKwkJCSAgICAgY29uc3QgY2hhciAqc2VydmVyX2FkZHJf
c3RyaW5nLAorCQkJICAgICBjaGFyICoqc19hZGRyLAorCQkJICAgICB1aW50MTZfdCAqc19wb3J0
KQoreworCWNoYXIgKnBsX3NxLCAqcHJfc3EsICpwbF9wZXJpb2QsICpwcl9wZXJpb2Q7CisJY2hh
ciAqcG9ydF9zZXAsICpjcG9ydDsKKwljaGFyICpidWY7CisJdW5zaWduZWQgaW50IHBvcnQ7CisJ
aW50IHJldCwgbmNoYXJzOworCisJYnVmID0gdGFsbG9jX3N0cmR1cChtZW1fY3R4LCBzZXJ2ZXJf
YWRkcl9zdHJpbmcpOworCWlmIChidWYgPT0gTlVMTCkgeworCQllcnJubyA9IEVOT01FTTsKKwkJ
cmV0dXJuIDE7CisJfQorCXBsX3NxID0gc3RyY2hyX20oYnVmLCAnWycpOworCXByX3NxID0gc3Ry
cmNocl9tKGJ1ZiwgJ10nKTsKKwlwbF9wZXJpb2QgPSBzdHJjaHJfbShidWYsICcuJyk7CisJcHJf
cGVyaW9kID0gc3RycmNocl9tKGJ1ZiwgJy4nKTsKKwlwb3J0X3NlcCA9IHN0cnJjaHJfbShidWYs
ICc6Jyk7CisJLyogU2VlIGlmIGl0cyBJUHY0IG9yIElQdjYgKi8KKwlpZiAocGxfc3EgIT0gTlVM
TCAmJiBwcl9zcSAhPSBOVUxMKSB7CisJCS8qIElQdjYgIC0gc3F1YXJlcyBkZXRlY3RlZCAqLwor
CQlEQkdfREVCVUcoIklQdjYgbmFtZXNlcnZlciAnJXMnIGRldGVjdGVkLlxuIiwgYnVmKTsKKwkJ
cG9ydF9zZXAgPSBwcl9zcSArIDE7CisJCWlmICgqcG9ydF9zZXAgPT0gJ1wwJykgeworCQkJKnNf
YWRkciA9IHBsX3NxICsgMTsKKwkJCSpwcl9zcSA9IDA7CisJCQkqc19wb3J0ID0gRE5TX1NFUlZJ
Q0VfUE9SVDsKKwkJCURCR19ERUJVRygiSVB2NiBuYW1lc2VydmVyIHBhcnNlZCwgbm8gcG9ydCBn
aXZlbiAnJXMnLCBwb3J0ICcldScuXG4iLCAqc19hZGRyLCAqc19wb3J0KTsKKwkJCXJldHVybiAw
OworCQl9CisJCWlmICgqcG9ydF9zZXAgIT0gJzonICkgeworCQkJZXJybm8gPSBFSU5WQUw7CisJ
CQlyZXR1cm4gMTsKKwkJfQorCQluY2hhcnMgPSAwOworCQljcG9ydCA9IHBvcnRfc2VwICsgMTsK
KwkJcmV0ID0gc3NjYW5mKGNwb3J0LCAiJXUlbiIsICZwb3J0LCAmbmNoYXJzKTsKKwkJaWYgKHJl
dCA8PSAwKSB7CisJCQllcnJubyA9IGVycm5vICE9IEVOT01FTSA/IEVJTlZBTCA6IEVOT01FTTsK
KwkJCXJldHVybiAxOworCQl9CisJCS8qIGNoZWNrIG5vIGp1bmsgYXQgZW5kIG9mIHBvcnQgc3Ry
aW5nICovCisJCWlmIChjcG9ydFtuY2hhcnNdICE9ICdcMCcpCisJCXsKKwkJCWVycm5vID0gRUlO
VkFMOworCQkJcmV0dXJuIDE7CisJCX0KKwkJaWYgKHBvcnQgPCAwIHx8IHBvcnQgPiA2NTUzNSkg
eworCQkJZXJybm8gPSBFSU5WQUw7CisJCQlyZXR1cm4gMTsKKwkJfQorCQkqc19wb3J0ID0gKHVp
bnQxNl90KXBvcnQ7CisJCSpwb3J0X3NlcCA9IDA7CisJCSpwcl9zcSA9IDA7CisJCSpzX2FkZHIg
PSBwbF9zcSArIDE7CisJCSpwbF9zcSA9IDA7CisJCURCR19ERUJVRygiSVB2NiBuYW1lc2VydmVy
IHBhcnNlZCAnJXMnLCBwb3J0ICcldScuXG4iLCAqc19hZGRyLCAqc19wb3J0KTsKKwkJcmV0dXJu
IDA7CisJfQorCWVsc2UgaWYgKHBsX3BlcmlvZCAhPSBOVUxMICYmIHByX3BlcmlvZCAhPSBOVUxM
ICYmIHBsX3BlcmlvZCAhPSBwcl9wZXJpb2QgJiYgcG9ydF9zZXAgIT0gTlVMTCkgeworCQkvKiBJ
UHY0IC0gbW9yZSB0aGFuIG9uZSBwZXJpb2QgaW4gc3RyaW5nICovCisJCURCR19ERUJVRygiSVB2
NCBuYW1lc2VydmVyICclcycgd2l0aCBwb3J0IGRldGVjdGVkLlxuIiwgc2VydmVyX2FkZHJfc3Ry
aW5nKTsKKwkJbmNoYXJzID0gMDsKKwkJY3BvcnQgPSBwb3J0X3NlcCArIDE7CisJCXJldCA9IHNz
Y2FuZihjcG9ydCwgIiV1JW4iLCAmcG9ydCwgJm5jaGFycyk7CisJCWlmIChyZXQgPD0gMCApIHsK
KwkJCWVycm5vID0gZXJybm8gIT0gRU5PTUVNID8gRUlOVkFMIDogRU5PTUVNOworCQkJcmV0dXJu
IDE7CisJCX0KKwkJLyogY2hlY2sgbm8ganVuayBhdCBlbmQgb2YgcG9ydCBzdHJpbmcgKi8KKwkJ
aWYgKGNwb3J0W25jaGFyc10gIT0gJ1wwJykKKwkJeworCQkJZXJybm8gPSBFSU5WQUw7CisJCQly
ZXR1cm4gMTsKKwkJfQorCQlpZiAocG9ydCA8IDAgfHwgcG9ydCA+IDY1NTM1KSB7CisJCQllcnJu
byA9IEVJTlZBTDsKKwkJCXJldHVybiAxOworCQl9CisJCSpzX3BvcnQgPSAodWludDE2X3QpcG9y
dDsKKwkJKnBvcnRfc2VwID0gMDsKKwkJKnNfYWRkciA9IGJ1ZjsKKwkJREJHX0RFQlVHKCJJUHY0
IG5hbWVzZXJ2ZXIgcGFyc2VkICclcycsIHBvcnQgJyV1Jy5cbiIsICpzX2FkZHIsICpzX3BvcnQp
OworCQlyZXR1cm4gMDsKKwl9CisJLyogRmFsbCB0aHJvdWdoICovCisJREJHX0RFQlVHKCJGYWxs
IHRocm91Z2ggbmFtZXNlcnZlciAnJXMnXG4iLCBidWYpOworCSpzX2FkZHIgPSBidWY7CisJKnNf
cG9ydCA9IEROU19TRVJWSUNFX1BPUlQ7CisJREJHX0RFQlVHKCJGYWxsIHRocm91Z2ggbmFtZXNl
cnZlciBwYXJzZWQgJyVzJywgcG9ydCAnJXUnLlxuIiwgKnNfYWRkciwgKnNfcG9ydCk7CisJcmV0
dXJuIDA7Cit9CisKIC8qIERlY2xhcmUgY2FsbGJhY2sgZnVuY3Rpb25zIHVzZWQgYmVsb3cuICov
CiBzdGF0aWMgdm9pZCBkbnNfdWRwX3JlcXVlc3RfZ2V0X3JlcGx5KHN0cnVjdCB0ZXZlbnRfcmVx
ICpzdWJyZXEpOwogc3RhdGljIHZvaWQgZG5zX3VkcF9yZXF1ZXN0X2RvbmUoc3RydWN0IHRldmVu
dF9yZXEgKnN1YnJlcSk7CkBAIC01NSw2ICsxNTIsOCBAQCBzdGF0aWMgc3RydWN0IHRldmVudF9y
ZXEgKmRuc191ZHBfcmVxdWVzCiAJc3RydWN0IGRuc191ZHBfcmVxdWVzdF9zdGF0ZSAqc3RhdGU7
CiAJc3RydWN0IHRzb2NrZXRfYWRkcmVzcyAqbG9jYWxfYWRkciwgKnNlcnZlcl9hZGRyOwogCXN0
cnVjdCB0ZGdyYW1fY29udGV4dCAqZGdyYW07CisJY2hhciAqc19hZGRyOworCXVpbnQxNl90IHNf
cG9ydDsKIAlpbnQgcmV0OwogCiAJcmVxID0gdGV2ZW50X3JlcV9jcmVhdGUobWVtX2N0eCwgJnN0
YXRlLCBzdHJ1Y3QgZG5zX3VkcF9yZXF1ZXN0X3N0YXRlKTsKQEAgLTcyLDggKzE3MSwxNCBAQCBz
dGF0aWMgc3RydWN0IHRldmVudF9yZXEgKmRuc191ZHBfcmVxdWVzCiAJCXJldHVybiB0ZXZlbnRf
cmVxX3Bvc3QocmVxLCBldik7CiAJfQogCi0JcmV0ID0gdHNvY2tldF9hZGRyZXNzX2luZXRfZnJv
bV9zdHJpbmdzKHN0YXRlLCAiaXAiLCBzZXJ2ZXJfYWRkcl9zdHJpbmcsCi0JCQkJCQlETlNfU0VS
VklDRV9QT1JULCAmc2VydmVyX2FkZHIpOworCXJldCA9IGRuc19wYXJzZV9zZXJ2ZXJfYWRkcmVz
cyhzdGF0ZSwgc2VydmVyX2FkZHJfc3RyaW5nLCAmc19hZGRyLCAmc19wb3J0KTsKKwlpZiAocmV0
ICE9IDApIHsKKwkJdGV2ZW50X3JlcV9lcnJvcihyZXEsIGVycm5vKTsKKwkJcmV0dXJuIHRldmVu
dF9yZXFfcG9zdChyZXEsIGV2KTsKKwl9CisKKwlyZXQgPSB0c29ja2V0X2FkZHJlc3NfaW5ldF9m
cm9tX3N0cmluZ3Moc3RhdGUsICJpcCIsIHNfYWRkciwgc19wb3J0LAorCQkJCQkJJnNlcnZlcl9h
ZGRyKTsKIAlpZiAocmV0ICE9IDApIHsKIAkJdGV2ZW50X3JlcV9lcnJvcihyZXEsIGVycm5vKTsK
IAkJcmV0dXJuIHRldmVudF9yZXFfcG9zdChyZXEsIGV2KTsKQEAgLTIwOSw2ICszMTQsOCBAQCBz
dGF0aWMgc3RydWN0IHRldmVudF9yZXEgKmRuc190Y3BfcmVxdWVzCiAJc3RydWN0IHRldmVudF9y
ZXEgKnJlcSwgKnN1YnJlcTsKIAlzdHJ1Y3QgZG5zX3RjcF9yZXF1ZXN0X3N0YXRlICpzdGF0ZTsK
IAlzdHJ1Y3QgdHNvY2tldF9hZGRyZXNzICpsb2NhbCwgKnJlbW90ZTsKKwljaGFyICpzX2FkZHI7
CisJdWludDE2X3Qgc19wb3J0OwogCWludCByZXQ7CiAKIAlyZXEgPSB0ZXZlbnRfcmVxX2NyZWF0
ZShtZW1fY3R4LCAmc3RhdGUsCkBAIC0yMzEsOCArMzM4LDE0IEBAIHN0YXRpYyBzdHJ1Y3QgdGV2
ZW50X3JlcSAqZG5zX3RjcF9yZXF1ZXMKIAkJcmV0dXJuIHRldmVudF9yZXFfcG9zdChyZXEsIGV2
KTsKIAl9CiAKLQlyZXQgPSB0c29ja2V0X2FkZHJlc3NfaW5ldF9mcm9tX3N0cmluZ3MoCi0JCXN0
YXRlLCAiaXAiLCBzZXJ2ZXJfYWRkcl9zdHJpbmcsIEROU19TRVJWSUNFX1BPUlQsICZyZW1vdGUp
OworCXJldCA9IGRuc19wYXJzZV9zZXJ2ZXJfYWRkcmVzcyhzdGF0ZSwgc2VydmVyX2FkZHJfc3Ry
aW5nLCAmc19hZGRyLCAmc19wb3J0KTsKKwlpZiAocmV0ICE9IDApIHsKKwkJdGV2ZW50X3JlcV9l
cnJvcihyZXEsIGVycm5vKTsKKwkJcmV0dXJuIHRldmVudF9yZXFfcG9zdChyZXEsIGV2KTsKKwl9
CisKKwlyZXQgPSB0c29ja2V0X2FkZHJlc3NfaW5ldF9mcm9tX3N0cmluZ3Moc3RhdGUsICJpcCIs
IHNfYWRkciwgc19wb3J0LAorCQkgICAgICAgCQkJCSZyZW1vdGUpOwogCWlmIChyZXQgIT0gMCkg
ewogCQl0ZXZlbnRfcmVxX2Vycm9yKHJlcSwgZXJybm8pOwogCQlyZXR1cm4gdGV2ZW50X3JlcV9w
b3N0KHJlcSwgZXYpOwpJbmRleDogc2FtYmEvbGliY2xpL2Rucy9saWJkbnMuaAo9PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
Ci0tLSBzYW1iYS5vcmlnL2xpYmNsaS9kbnMvbGliZG5zLmgKKysrIHNhbWJhL2xpYmNsaS9kbnMv
bGliZG5zLmgKQEAgLTM5LDUgKzM5LDEzIEBAIHN0cnVjdCB0ZXZlbnRfcmVxICpkbnNfY2xpX3Jl
cXVlc3Rfc2VuZCgKIGludCBkbnNfY2xpX3JlcXVlc3RfcmVjdihzdHJ1Y3QgdGV2ZW50X3JlcSAq
cmVxLCBUQUxMT0NfQ1RYICptZW1fY3R4LAogCQkJIHN0cnVjdCBkbnNfbmFtZV9wYWNrZXQgKipy
ZXBseSk7CiAKKy8qCisgKiBGb3IgdGVzdHBhcm0gdXNhZ2UgLSB0aWdodGVuIHRoZSBwYXJzaW5n
IHRvIG1ha2UgY29uZmlnIGZpbGUKKyAqIGVhc2llciB0byBnZXQgcmlnaHQKKyAqLworaW50IGRu
c19wYXJzZV9zZXJ2ZXJfYWRkcmVzcyhUQUxMT0NfQ1RYICptZW1fY3R4LAorCQkJICAgICBjb25z
dCBjaGFyICpzZXJ2ZXJfYWRkcl9zdHJpbmcsCisJCQkgICAgIGNoYXIgKipzX2FkZHIsCisJCQkg
ICAgIHVpbnQxNl90ICpzX3BvcnQpOwogCiAjZW5kaWYgLypfX0xJQkROU19IX18qLwo=
--0000000000003b4fc705cb0a31be--

