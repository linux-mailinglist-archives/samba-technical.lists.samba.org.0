Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A833B971B
	for <lists+samba-technical@lfdr.de>; Thu,  1 Jul 2021 22:18:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=HcLHKlaVkqhT5lt9f7bY89aHXT8dMeptaAmZl2pqjrU=; b=hdXoKVkp7BXtyau8l6urWaLlii
	jZ7tcqPsMrfBKOw5zTayTJhTB/wHKuuPjbGJxvlYUhy8I4I/Nmv9sOwenSvw9nfqhW9GfLxCL4Fw7
	fm9kwcSJB/AaPfFuzso54gUwxqN3pW7/xacqfXx7Csi/FJTz/iXhYjp41a9btvN/Er2dJ3jbxKVSe
	xw+rAzKzAF9MFlZl230qwJ5Xj2P3PH8gJuvOedwwsTYFMUa9uFQAkwtXIJ0RH/bHTKPOoD2jCFoqc
	XDKdhylBm4338ziy84MMKMjlsuiu52ypKDg7e8Umd5hPDp0aqmnhOX12D3194AsW5J29d7wn004iX
	o9pDhocQ==;
Received: from ip6-localhost ([::1]:54018 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lz38E-00BZv5-Lh; Thu, 01 Jul 2021 20:17:54 +0000
Received: from pluto.hosts.bitme.ch ([178.209.51.11]:35802) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lz389-00BZuw-GP
 for samba-technical@lists.samba.org; Thu, 01 Jul 2021 20:17:52 +0000
Received: from authenticated-user (localhost [127.0.0.1])
 by pluto.hosts.bitme.ch (Postfix) with ESMTPSA id 605814B1A1CD
 for <samba-technical@lists.samba.org>; Thu,  1 Jul 2021 20:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=znerol.ch; s=pluto-01;
 t=1625170050; bh=yjSaMut1uQxBB9qreIftgHOl3QltQa2dpHZR4QflFHI=;
 h=Date:From:To:Subject:From;
 b=sU27HbQGUoXgF4PXQ1Ng1iuXGc/1fqSdWnM0mAQoAW+wXMYcOC3mzLcSPyUoFipq2
 GiNO+NHYkij0dfNzDSoXX82xafZ1NngcG3SYnwP2hRJ0H+ZpkHcgLXgLR2Y820d7ot
 FfvUjeD343CLqAnHromjAfwi6CueoQ45dejf7LV4xUGwr/6Nsykk5lkHMm42rTB77Z
 diLx2SnCYdJzLqoPxf1X1NAbdSbTrTkcyYpW/AwO8zCk0i5ymYvgrwnvcKse9fz1b1
 +thi/usKUGE6k38hayIeTAZNb7d9EmPLE0xk8G9ldKrQMUuQigBw9/29Kz/fCBgNQH
 WvuzFCVyhG1DA==
Date: Thu, 1 Jul 2021 22:07:27 +0200
To: samba-technical@lists.samba.org
Subject: gensec_krb5_start() fails silently with tlocal_addr / tremote_addr
 is IPv6
Message-ID: <20210701220727.76fa9c60@bonemachine>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: Lorenz Schori via samba-technical <samba-technical@lists.samba.org>
Reply-To: Lorenz Schori <lo@znerol.ch>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

The function gensec_krb5_start() returns NT_STATUS_INTERNAL_ERROR when
tlocal_addr / tremote_addr are IPv6. No debug messages are generated in
this case and nothing obvious shows up in strace. Only thing i see in
logs even with log level 10 are the following lines:


    Starting GENSEC mechanism krb5
    Failed to start GENSEC server mech krb5: NT_STATUS_INTERNAL_ERROR


As a result things like kpasswd do not work.

Loking through the samba source there are not so many code paths through
gensec_krb5_start() without any DEBUG statements. Thus I believe what
happens is the following (from gensec_krb.c, see [1]).

		sockaddr_ret = tsocket_address_bsd_sockaddr(
			tlocal_addr, &addr.u.sa, sizeof(addr.u.sa));
		if (sockaddr_ret < 0) {
			talloc_free(gensec_krb5_state);
			return NT_STATUS_INTERNAL_ERROR;
		}

When tlocal_addr is IPv6, then sockaddr_ret will return an error.
Looking at other examples of tsocket_address_bsd_sockaddr it seems that
most of them use sizeof(struct sockaddr_storage) for the last param
except the one call shown above.

I suspect that this might be the problem. Consider the following test
program:

$ cat <<EOF > /tmp/test.c
#include <netinet/in.h>
#include <stdio.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <unistd.h>

#define sockaddr_storage sockaddr_in6
struct samba_sockaddr {
	socklen_t sa_socklen;
	union {
		struct sockaddr sa;
		struct sockaddr_in in;
		struct sockaddr_in6 in6;
		struct sockaddr_un un;
		struct sockaddr_storage ss;
	} u;
};

int main(void) {
        struct samba_sockaddr addr;
        printf("sizeof(addr.u.sa): %ld\n", sizeof(addr.u.sa));
        printf("sizeof(struct sockaddr_storage): %ld\n",
		sizeof(struct sockaddr_storage));
	return 0;
}

EOF

On my machine, this produces the following output:

./a.out 
sizeof(addr.u.sa): 16
sizeof(struct sockaddr_storage): 28

Cheers,
Lorenz

1) gensec_krb3.c:
<https://github.com/samba-team/samba/blob/b3ee034b4d457607ef25a5b01da64e1eaf5906dd/source4/auth/gensec/gensec_krb5.c#L152-L157>

