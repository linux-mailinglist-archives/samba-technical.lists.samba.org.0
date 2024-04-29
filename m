Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4B58B5D59
	for <lists+samba-technical@lfdr.de>; Mon, 29 Apr 2024 17:21:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=A9ktU0Nf4obPdWQwapwO4Fue1aOYnmHa/ofJdgBDRUs=; b=OQ8WAu9uzxkOqphQZO582dKwQ8
	AoDb8BcA4IDLa05pQd/GGvJI+Ej35L9F1a2vq4U3cURH4UHJSeOEqKd7Xm2lIQqWibG8mYvMczPi/
	Tofhwp3iaCKl+lIbjNn21FswzDD7m/GlDAkViRyC2l4nikn1lreDanjRts1o5KuBVUvVhbSs77zJo
	dGTwC708CGKsriEuuMXOzittye0WscxRbywYgBpb0Mp2cvBSajtSV5W6uyQaM1oMSJI4QvxICe4hx
	8KMQgZaWemMIKwPHDj6BUCb7lEZ886PAPHHDjZ32NonowjLQKS50iA9tGe/o2GrH1SlMesHmTGipg
	K+d9IX1g==;
Received: from ip6-localhost ([::1]:63060 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s1Snx-0060Lp-MF; Mon, 29 Apr 2024 15:20:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25676) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s1Snt-0060Li-5Y
 for samba-technical@lists.samba.org; Mon, 29 Apr 2024 15:20:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=A9ktU0Nf4obPdWQwapwO4Fue1aOYnmHa/ofJdgBDRUs=; b=zpGPjFtnZ6GaKQKZXq10ucwhLa
 VtWqH5hnkxprC+3k6fB9xaso9eMcly2wLESyp0c3jeqr+FDBkGrf4KA826rEe5bgeeAWyHm/1bCaV
 c3Dbuc9KRF9o6QxxdqZGbz1oxJ5h5iG9JqJT2iHL662kdkfqfQ4qf9LQgZrKaIc5+yGQvMnpXnBnY
 lx02FXgcCQH0zOCSIFLs0k5MA5RaTZyLkG9Q/9n2WpVTHbHtFMM+ZhWZQzMkUpTvetstaVzQOQFZT
 8ravFC28+1TzSrjmri3stsdv6t6nOoVdbvqrCJ6b0WyDVkNLfnsXCBsNhBoFCeQ0uZRdhhMlQ7jLX
 3UE51s8mvFl1xn4CA23bNBN1eYeyhUdME1u3Gymq/elQsggrCstgeG3vX8B8bH1r/HuaBhtaXSbSp
 chjmGOmRHh0BR7+z3IwE9VswiihPuEgnJ8bmZIk5bUY2mx3GUM4NZNhz9hB7CYFlZqLQK1lrDiXFv
 qmpIWBbP36Ms89qytcWuukrU;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s1Snn-008ww2-0f; Mon, 29 Apr 2024 15:20:23 +0000
Message-ID: <2365b657-bea4-4527-9fce-ad11c690bde3@samba.org>
Date: Mon, 29 Apr 2024 17:20:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH net-next 0/5] net: In-kernel QUIC implementation with
 Userspace handshake
To: Xin Long <lucien.xin@gmail.com>
References: <cover.1710173427.git.lucien.xin@gmail.com>
 <74d5db09-6b5c-4054-b9d3-542f34769083@samba.org>
 <CADvbK_dzVcDKsJ9RN9oc0K1Jwd+kYjxgE6q=ioRbVGhJx7Qznw@mail.gmail.com>
 <f427b422-6cfc-45ac-88eb-3e7694168b63@samba.org>
 <CADvbK_cA-RCLiUUWkyNsS=4OhkWrUWb68QLg28yO2=8PqNuGBQ@mail.gmail.com>
 <438496a6-7f90-403d-9558-4a813e842540@samba.org>
 <CADvbK_fkbOnhKL+Rb+pp+NF+VzppOQ68c=nk_6MSNjM_dxpCoQ@mail.gmail.com>
 <1456b69c-4ffd-4a08-b120-6a00abf1eb05@samba.org>
 <CADvbK_cQRpyzHG4UUOzfgmqLndvpx5Cd+d59rrqGRp0ic3PyxA@mail.gmail.com>
 <95922a2f-07a1-4555-acd2-c745e59bcb8e@samba.org>
 <CADvbK_eR4++HbR_RncjV9N__M-uTHtmqcC+_Of1RKVw7Uqf9Cw@mail.gmail.com>
 <CADvbK_dEWNNA_i1maRk4cmAB_uk4G4x0eZfZbrVX=zJ+2H9o_A@mail.gmail.com>
 <dc3815af-5b46-452b-8bcc-30a0934740a2@samba.org>
 <CADvbK_e__qpCa44uF+J2Z+2Lhb2suktTNT+CeQayk_uhckVYqQ@mail.gmail.com>
Content-Language: en-US, de-DE
In-Reply-To: <CADvbK_e__qpCa44uF+J2Z+2Lhb2suktTNT+CeQayk_uhckVYqQ@mail.gmail.com>
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 Sabrina Dubroca <sd@queasysnail.net>, network dev <netdev@vger.kernel.org>,
 Jeff Layton <jlayton@kernel.org>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <smfrench@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Chuck Lever III <chuck.lever@oracle.com>, Tyler Fanelli <tfanelli@redhat.com>,
 Samba Technical <samba-technical@lists.samba.org>, kuba@kernel.org,
 Paolo Abeni <pabeni@redhat.com>, davem@davemloft.net,
 Pengtao He <hepengtao@xiaomi.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Xin Long,

>>
> Just confirmed from other ebpf experts, there are no in-kernel interfaces
> for loading and interacting with BPF maps/programs(other than from BPF itself).
> 
> It seems that we have to do this match in QUIC stack. In the latest QUIC
> code, I added quic_packet_get_alpn(), a 59-line function, to parse ALPNs
> and then it will search for the listen sock with these ALPNs in
> quic_sock_lookup().
> 
> I introduced 'alpn_match' module param, and it can be enabled when loading
> the module QUIC by:
> 
>    # modprobe quic alpn_match=1
> 
> You can test it by tests/sample_test in the latest code:
> 
>    Start 3 servers:
> 
>      # ./sample_test server 0.0.0.0 1234 \
>          ./keys/server-key.pem ./keys/server-cert.pem smbd
>      # ./sample_test server 0.0.0.0 1234 \
>          ./keys/server-key.pem ./keys/server-cert.pem h3
>      # ./sample_test server 0.0.0.0 1234 \
>          ./keys/server-key.pem ./keys/server-cert.pem ksmbd
> 
>    Try to connect on clients with:
> 
>      # ./sample_test client 127.0.0.1 1234 ksmbd
>      # ./sample_test client 127.0.0.1 1234 smbd
>      # ./sample_test client 127.0.0.1 1234 h3
> 
>    to see if the corresponding server responds.
> 
> There might be some concerns but it's also a useful feature that can not
> be implemented in userland QUICs. The commit is here:
> 
> https://github.com/lxin/quic/commit/de82f8135f4e9196b503b4ab5b359d88f2b2097f
> 
> Please check if this is enough for SMB applications.

It look great thanks!

> Note as a listen socket is now identified by [address + port + ALPN] when
> alpn_match=1, this feature does NOT require SO_REUSEPORT socket option to
> be set, unless one wants multiple sockets to listen to
> the same [address + port + ALPN].

I'd argue that this should be the default and be required before listen()
or maybe before bind(), so that it can return EADDRINUSE. As EADDRINUSE should only
happen for servers it might be useful to have a QUIC_SOCKOPT_LISTEN_ALPN instead of
QUIC_SOCKOPT_ALPN. As QUIC_SOCKOPT_ALPN on a client socket should not generate let
bind() care about the alpn value at all.

For listens on tcp you also need to specify an explicit port (at least in order
to be useful).

And it would mean that all application would use it and not block other applications
from using an explicit alpn.

Also an module parameter for this means the administrator would have to take care
of it, which means it might be unuseable if loaded with it.

I hope to find some time in the next weeks to play with this.
Should be relatively trivial create a prototype for samba's smbd.

Thanks!
metze

